load("render.star", "render")
load("encoding/base64.star", "base64")
load("http.star", "http")
load("humanize.star", "humanize")

HOUSE_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAABmJLR0QA/wD/AP+gvaeTAAAAhUlEQVQYlWNgQALWR/x4rY/48SKLMcEYznsixVn/cu1n/cN51PVIhBRMnJGBgYHB7mCoItN/pp0MDAyqUPH7zMwMHnttV95idNwXavyfiWkrAwODOAMKYHz7n+GvL9N+p9VnGRkYDkEFj0MwAwMjw/99Bx1WH2dB1vOf4X8/1F5LDEeSDQCv0iKWIbMWCgAAAABJRU5ErkJggg==
""")

SUN_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAABmJLR0QA/wD/AP+gvaeTAAAAgklEQVQYlY3OoQrCYADE8Z9D2LSZtA4WB+6dbAuCTyIY1nwcuwM1DVdtxrkyDZ/BIOjBleOO//FDI3juxBKZQYlYZOuhGa31Y5DITCcnRcoTdbuiy3GOwKBUpMxnLGYsUwYbiN6g/gu+/yzsHVtu9+D6SqSC8OGhocsdLqUwq0L2h15n2SLkw8NXGQAAAABJRU5ErkJggg==
""")

NET_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAABmJLR0QA/wD/AP+gvaeTAAAAhklEQVQYlYWOQQ7BUBiEv7/PQtyApqR6ptqIjZM4ie6fS7iHqLwi7wAiscBYECQi/VaTyWRmoAV7Ky+Xh7gE2I36cyZ2+wS8XBFiJZg9TfnsPJiuF3btAIz3xwJLugarV7E1vUMObJK/484MIAGos3SLuEiUEiWShqe0/jlZhFjdQd8nW3kAz/MuOlKcnn4AAAAASUVORK5CYII=
""")

POWER_URL = "http://192.168.0.100:8123/api/states/sensor.energy_production"
USAGE_URL = "http://192.168.0.100:8123/api/states/sensor.energy_usage"
DAILY_USAGE_URL = "http://192.168.0.100:8123/api/states/sensor.daily_usage"
DAILY_PRODUCTION_URL = "http://192.168.0.100:8123/api/states/sensor.daily_production"
DAILY_NET_URL = "http://192.168.0.100:8123/api/states/sensor.daily_net_production"

HEADERS = {
"Authorization": "Bearer PUT-HA-LONG-LIVED-ACCESS-TOKEN-HERE",
"content-type": "application/json",
}

rep_power = http.get(POWER_URL, params={}, headers = HEADERS)
power = humanize.float('#,###.', float(rep_power.json()["state"]))

rep_current_usage = http.get(USAGE_URL, params={}, headers = HEADERS)
current_usage = humanize.float('#,###.', float(rep_current_usage.json()["state"]))

rep_usage = http.get(DAILY_USAGE_URL, params={}, headers = HEADERS)
usage = float(rep_usage.json()["state"])

rep_solar = http.get(DAILY_PRODUCTION_URL, params={}, headers = HEADERS)
solar = float(rep_solar.json()["state"])

rep_net = http.get(DAILY_NET_URL, params={}, headers = HEADERS)
net = float(rep_net.json()["state"])

def main():
    return render.Root(
        child = render.Column(
            children = [
                render.Row(
                    children = [
                        render.Image(src = HOUSE_ICON),
                        render.Text("%sW/" % current_usage),
                        render.Text(content="%dkWh" % usage),
                    ],
                ),
                render.Row(
                    children = [
                        render.Image(src = SUN_ICON),
                        render.Text("%sW/" % power),
                        render.Text("%dkWh" % solar),
                    ],
                ),
                render.Row(
                    children = [
                        render.Image(src = NET_ICON),
                        render.Text("Net:%dkWh" % net),
                    ],
                )
            ],
        ),
    )


