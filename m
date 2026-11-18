Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014335;
	b=fuhszbYkKmCutbGNYY3vzmfQDdvXN/zuEkiqTkDOIW/upqNtUFH1ro9zm8/QCAQrzM/E
	 OX869ohbsqFNtgzNiMR3jIz1wGtjR9LfoR36pVSqKCD2ESq2u3p63PHkVzkM4dEMtZoKT
	 mx8YymHVEm1WaNeBatq6skPt9h2Bf9k1Jk5ywnIhCK1dymShb8VX7Bonta5VeD4J11hSm
	 ndM6ABecszRDDAoZl3FdHVDW2f2KsX7xWk1Z3SaAaPMkOaawqmdzfgZqmeaIIlf1tTFPZ
	 7NGEgmgKRPwNSpW8nVndUY/OElj5gd3rPfJN4mJYIMsgoAwdXorYLSC+mILvQeWCpYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014335;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Ngd1ylQJZsyIhisBHKVQbNyEuMvvCsiXT5bSBK+uZ88=;
	b=3iSgzFeERL8YJXZT4a7QyQHPkYMOejI6iS0oi554tOv6ZE8qb5OZ/4Irfui07Gj4Wzw9
	 Csa0Az23v1V2QXW16O1aQm1h/UjY8/EOiy1uNlUE0RJNkS4yY6lqHtWDxT15uM+j4YIfm
	 0CAUE4oZuwDUViB4FbG2rF0rd7+Mrek00EwKdB01YXS4P/Q5Hmo8v69R+02nt1cvoVcl8
	 Bv2S2D02F3gX++y06P8r842GjP2RR6pT3ng5/HcI43Y0ucmSsb1+M/i20Mdq1keq0E2CW
	 ve7IkhpO9KpPEfAS8+jhQgDG/DSGU8nXdjdA+8t5QP7B2XZL+GWSR6KSxlxLjTa8hkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZjvVk8SE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108560A260E
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B108560A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZjvVk8SE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 934101A16E2;
	Wed, 18 Nov 2026 15:05:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B23D5FE9B;
	Wed, 18 Nov 2026 15:05:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2592E11BC222C;
	Wed, 18 Nov 2026 16:05:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795014332; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ngd1ylQJZsyIhisBHKVQbNyEuMvvCsiXT5bSBK+uZ88=;
	b=ZjvVk8SEVTjBEMNjf6hCx304VKHmzpd2ZHBd5uv8JOFRgvetRHJJCO0NtBAAg2YKilUxt1
	B3BvjP/a2v/4np2Qt0EeUBGDZmcN42Fhbvj4S2U1133e8Fxt+Z8W/azweokD1pmKxUFNWw
	o/53E/lyNMfTLlHEJ9yezye3s+unbiWWXe2t3rvqcwulgT6wq5Gr0FDYS7gLXupjuKakik
	yo9Ttb1rW5oFnbgWUyqGoojxUvdConMjI/YSiDw4eNuteGe6tPdWJX3ypUic9HzKDMGhbj
	i1pwaO/jf3SGvGIRYjrSEZzh4JZg1eotIyflEsMoCy/Ctyp8wDuxbCxPWMfdqA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Michal Kubecek <mkubecek@suse.cz>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH ethtool-next 2/2] ethtool: Introduce a command to list an interface's ports
Date: Wed, 18 Nov 2026 16:05:22 +0100
Message-ID: <20261118150523.2762733-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118150523.2762733-1-maxime.chevallier@bootlin.com>
References: <20261118150523.2762733-1-maxime.chevallier@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Introduce the "--show-ports <dev>" command to list an interface's ports
using the ETHTOOL_MSG_PORT_GET netlink command.

It shows the supported linkmodes, interfaces, type and upstream info,
using either plain text or JSON mode.

Add a small manpage alongside it.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Makefile.am      |   1 +
 ethtool.8.in     |  30 +++++++++++
 ethtool.c        |   6 +++
 netlink/extapi.h |   2 +
 netlink/port.c   | 134 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 173 insertions(+)
 create mode 100644 netlink/port.c

diff --git a/Makefile.am b/Makefile.am
index db22be4..f253ba0 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -56,6 +56,7 @@ ethtool_SOURCES += \
 		  netlink/phy.c \
 		  netlink/tsconfig.c \
 		  netlink/mse.c \
+		  netlink/port.c \
 		  uapi/linux/const.h uapi/linux/ethtool.h \
 		  uapi/linux/ethtool_netlink.h \
 		  uapi/linux/ethtool_netlink_generated.h \
diff --git a/ethtool.8.in b/ethtool.8.in
index b404b93..d8ce895 100644
--- a/ethtool.8.in
+++ b/ethtool.8.in
@@ -594,6 +594,9 @@ ethtool \- query or control network driver and hardware settings
 .HP
 .B ethtool \-\-show\-phys
 .I devname
+.HP
+.B ethtool \-\-show\-ports
+.I devname
 .
 .\" Adjust lines (i.e. full justification) and hyphenate.
 .ad
@@ -2149,6 +2152,33 @@ If the PHY's upstream_type is
 .B upstream_sfp_name
 If the PHY is within an SFP/SFF module, this field contains the name of the
 upstream SFP bus.
+.RE
+.TP
+.B \-\-show\-ports
+Show the ports of an interface, that is the physical connection points through
+which it can be linked to a medium, such as an RJ45 connector or an SFP cage.
+.RS 4
+.TP
+.B port\-id
+The port's identifier, unique within the network interface.
+.TP
+.B type \ mdi | sfp
+The nature of the port.
+.B mdi
+ports connect directly to a medium.
+.B sfp
+ports are either an SFP cage, or a port provided by the module sitting in a
+cage.
+.TP
+.B supported\-link\-modes
+The link modes this port can operate at. Not reported for SFP cages.
+.TP
+.B supported\-interfaces
+For SFP cages, the MII interfaces that can be used towards the module.
+.TP
+.B upstream\-port
+If any, the port\-id of the port that feeds into this one, such as the cage a
+module sits in.
 
 .SH BUGS
 Not supported (in part or whole) on all network drivers.
diff --git a/ethtool.c b/ethtool.c
index 30a1d97..8482a10 100644
--- a/ethtool.c
+++ b/ethtool.c
@@ -6514,6 +6514,12 @@ static const struct option args[] = {
 		.nlfunc	= nl_gmse,
 		.help	= "Show Mean Square Error (MSE) diagnostics",
 	},
+	{
+		.opts	= "--show-ports",
+		.json	= true,
+		.nlfunc	= nl_get_port,
+		.help	= "List ports"
+	},
 	{
 		.opts	= "-h|--help",
 		.no_dev	= true,
diff --git a/netlink/extapi.h b/netlink/extapi.h
index e10af62..e7b6140 100644
--- a/netlink/extapi.h
+++ b/netlink/extapi.h
@@ -61,6 +61,7 @@ int nl_spse(struct cmd_context *ctx);
 int nl_flash_module_fw(struct cmd_context *ctx);
 int nl_get_phy(struct cmd_context *ctx);
 int nl_gmse(struct cmd_context *ctx);
+int nl_get_port(struct cmd_context *ctx);
 
 void nl_monitor_usage(void);
 
@@ -142,6 +143,7 @@ nl_get_eeprom_page(struct cmd_context *ctx __maybe_unused,
 #define nl_flash_module_fw	NULL
 #define nl_get_phy		NULL
 #define nl_gmse			NULL
+#define nl_get_port		NULL
 
 #endif /* ETHTOOL_ENABLE_NETLINK */
 
diff --git a/netlink/port.c b/netlink/port.c
new file mode 100644
index 0000000..b845d01
--- /dev/null
+++ b/netlink/port.c
@@ -0,0 +1,134 @@
+/*
+ * port.c - List the ports of an interface and their parameters
+ *
+ * Implementation of "ethtool --show-ports <dev>"
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <string.h>
+#include <stdio.h>
+
+#include "../internal.h"
+#include "../common.h"
+#include "netlink.h"
+#include "bitset.h"
+
+/* PORT_GET */
+
+static const char *port_type_str(uint32_t port_type)
+{
+	switch (port_type) {
+	case ETHTOOL_PORT_TYPE_MDI: return "mdi";
+	case ETHTOOL_PORT_TYPE_SFP: return "sfp";
+	default: return "unknown";
+	}
+}
+
+static void port_interfaces_walk_cb(unsigned int idx __maybe_unused,
+				    const char *name, bool val, void *data)
+{
+	bool *first = data;
+
+	if (!val)
+		return;
+
+	if (!is_json_context() && !*first)
+		putchar(' ');
+	*first = false;
+
+	print_string(PRINT_ANY, NULL, "%s", name);
+}
+
+static int port_dump_interfaces(const struct nlattr *bitset)
+{
+	bool first = true;
+	int ret;
+
+	open_json_array("supported-interfaces", "");
+	if (!is_json_context())
+		printf("\tSupported MII interfaces: ");
+	ret = walk_bitset(bitset, NULL, port_interfaces_walk_cb, &first);
+	close_json_array("\n");
+
+	return ret;
+}
+
+static int port_reply_cb(const struct nlmsghdr *nlhdr, void *data)
+{
+	const struct nlattr *tb[ETHTOOL_A_PORT_MAX + 1] = {};
+	struct nl_context *nlctx = data;
+	DECLARE_ATTR_TB_INFO(tb);
+	uint32_t port_type;
+	int ret;
+
+	ret = mnl_attr_parse(nlhdr, GENL_HDRLEN, attr_cb, &tb_info);
+	if (ret < 0)
+		return MNL_CB_OK;
+	nlctx->devname = get_dev_name(tb[ETHTOOL_A_PORT_HEADER]);
+	if (!dev_ok(nlctx))
+		return MNL_CB_OK;
+
+	print_nl();
+
+	open_json_object(NULL);
+
+	print_string(PRINT_ANY, "ifname", "Port for %s:\n", nlctx->devname);
+
+	show_u32("port-id", "\tPort id: ", tb[ETHTOOL_A_PORT_ID]);
+
+	if (tb[ETHTOOL_A_PORT_TYPE]) {
+		port_type = mnl_attr_get_u32(tb[ETHTOOL_A_PORT_TYPE]);
+		print_string(PRINT_ANY, "type", "\tPort type: %s\n",
+			     port_type_str(port_type));
+	}
+
+	if (tb[ETHTOOL_A_PORT_SUPPORTED_MODES]) {
+		ret = dump_link_modes(nlctx, tb[ETHTOOL_A_PORT_SUPPORTED_MODES],
+				      false, LM_CLASS_REAL,
+				      "Supported link modes:  ", NULL, "\n",
+				      "Not reported", "supported-link-modes");
+		if (ret < 0)
+			goto out;
+	}
+
+	if (tb[ETHTOOL_A_PORT_SUPPORTED_INTERFACES]) {
+		ret = port_dump_interfaces(tb[ETHTOOL_A_PORT_SUPPORTED_INTERFACES]);
+		if (ret < 0)
+			goto out;
+	}
+
+	if (tb[ETHTOOL_A_PORT_UPSTREAM_PORT])
+		show_u32("upstream-port", "\tUpstream port id: ",
+			 tb[ETHTOOL_A_PORT_UPSTREAM_PORT]);
+
+out:
+	close_json_object();
+
+	return MNL_CB_OK;
+}
+
+int nl_get_port(struct cmd_context *ctx)
+{
+	struct nl_context *nlctx = ctx->nlctx;
+	struct nl_socket *nlsk = nlctx->ethnl_socket;
+	int ret;
+
+	if (netlink_cmd_check(ctx, ETHTOOL_MSG_PORT_GET, true))
+		return -EOPNOTSUPP;
+	if (ctx->argc > 0) {
+		fprintf(stderr, "ethtool: unexpected parameter '%s'\n",
+			*ctx->argp);
+		return 1;
+	}
+
+	ret = nlsock_prep_filtered_dump_request(nlsk, ETHTOOL_MSG_PORT_GET,
+						ETHTOOL_A_PORT_HEADER, 0);
+	if (ret)
+		return ret;
+
+	new_json_obj(ctx->json);
+	ret = nlsock_send_get_request(nlsk, port_reply_cb);
+	delete_json_obj();
+	return ret;
+}
-- 
2.56.1

