String[] components = _1.split('/');

if (components[0] == "app" && components[1] == "code") {
	return components[2] + '\\' + components[3];
} else {
	return "error";
}
