from jinja2 import Environment, PackageLoader


if __name__ == "__main__":
    env = Environment(loader=PackageLoader("genconf", "."))
    template = env.get_template("nginx.conf.j2")
    print(template.render(
        addr="*:80",
        path="/",
        file="index.html",
    ))
