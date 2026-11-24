Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795484620;
	b=TYD49EbTzKrATcvI6y3SSLbGfGFv9917Im1m33R77qmYql0Exwni7N4RVT+KofK/dpQ0
	 Xc4B626vS6ZkWnSfAQjkTPMBMEgx8DCAY0xgq+IeAOdphzAQwOqrUTPJpZUCWqAeE31Ww
	 55Jrbqp3Z0YODEPgcXec5is3bTzpiRcVJfZlaymNa0LjUPmX5DB5vs4hxAsUQmnnGG/aL
	 sMC1QqC39cc2Cn0MYcpgVyQ8EZU2Pn+mimcFfaHGPv5t6KPYfmmy23H6ZcWvcSJWPQeUO
	 a4djIDdERBtBbbi2Qmu1cgm9pX3dcJG4v4i3HbYPnV/IvVqoKOuTC9Gbx0pnl2tUzXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484620;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CA+64k4ePJlgQIbx9pPT5IhPD4zN3sufELL4QHwnj28=;
	b=DIlPrpX898v3KBC4aIniSoD2DySmAE9JwDkePNFjukXPUvLpd/niyQ5w4yJ2eEKm1l4d
	 QbCNg4J27LHNl6l/MWOQmwWvRMdRH7DaBCQVTaNN3bL86tjErJF8fIyk1EMk0Zuv75Kj9
	 7zJC59hjanR1S0s11pR4ZOdhnfbeE4sCaehBK87RIXmoWRf9Bxqq4qB7DroY4Kywin0ak
	 fC3GzUsSJ3OeWqf0GAQivM8jBoGJm9Z3fUqaroz/va2M4P2PYrboGWxWlnA/v1z1ymyVH
	 FkOjPtO1olbd5dPLnJ2dQC9QvmGWYqk3d6O/t0d09c3KA2cy4G6EWHRReOI+CskCUWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vq/8fgHm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA9606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vq/8fgHm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795484619;
	b=E31SAElxiCnGT7luuSKRqZy127146ASU1ARna0UA2uc0lwflam5ybt7cbdqv0LPG5k+L
	 DRcnJYwVWPKq7O+Ir2oGqsINhCUKtpA7CXpvwkMIf+HlbP+TN5cPqnXBxCikK7nm5+x7x
	 brUY7pSzHYCnxjeaLPIotTHOJ0swNQm7Vv2ncHcJoeEhjFMj74pKzykE/RElZbibz6mAG
	 /1k2dO+mxC4/5A0yYVWXeoENLIxHRTkdBoZ9OvEpBmqaczITJcdhgTPoTk+WfbH7bce6r
	 8oR6oXMZRvidOsP0Pc6zO4ygd8mnOnKMp6aMkBhzDA2Tuv/0aQzF7giIeBMOB+MszFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795484619;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CA+64k4ePJlgQIbx9pPT5IhPD4zN3sufELL4QHwnj28=;
	b=nG2yjPJOvPVhbqkO5qPpOIkUosi0fGzODYcOGah3RthUJfmK7XLu/JCXVIiUEbHKyv/v
	 bzgwcIRUcE5st8PqLbreyEbdAaG7NubpoQ61KwYM5VKE6qqk2ddVrZAYbrpTFlmdgl1Sl
	 sWAWkELHzq9nc96Nwx+F91KJnewGoL/z3YcfOoIKwRkMz37R5f5ySZQz3w0vb1AYQOXKa
	 OayXZPFmrbUNWqUHF2X9MjWI58aps9PH1vALQXr3wB4aImRtS4JMy94Xg3sUAAFJ748il
	 X/AMKrFBlfSz/Xhn1BcEBzukcjN4npkth38zJFqh1L8zJ4tHTuFPoGDsV4hSKYa0H4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B79381F000D4;
	Tue, 24 Nov 2026 01:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795484619;
	bh=CA+64k4ePJlgQIbx9pPT5IhPD4zN3sufELL4QHwnj28=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Vq/8fgHmZkhm9QkCOyobG3jqAjPpUHEuwCrPvUno84eNJcV9RP09WrbaRV25glfeP
	 xendFS7ZVkLitbmM6mq1ZRvQ7AAF9RY0aYSMsVCyLcTtrMzkntiGVIk+eQx+7slEFf
	 g8OWRPae5uETHHOLAj9lGvHu6FyYADqMZAGEl1qeiKYVE5wfjnBXYICnDOuF7o2CjK
	 /ZC598FVu4YWUNO9VfR9x3yBImfCNxkwiwRsdU/sL0jfbblQvUYHTK5+7QZw91IZb3
	 k5H5yIgOtoumUYjfianb0o2Fyuc+3u0NxvxCSKpBT1z4J0WiIDBQpavvIitS0IPOaK
	 +Dn4fHoW62T9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1C7CF4C81A;
	Tue, 24 Nov 2026 01:43:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 04:43:29 +0300
Subject: [PATCH net-next] net: dsa: qca8k: select two-byte headers during
 setup
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-qca8k-two-byte-header-init-v1-1-c644025b69fa@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrCMBBA4auUWTvQhJJWryIu8jO1ozDVZNRK6
 d2Nunw8+FYolJkKHJoVMj258Cw1zK6BOHk5E3KqDba1zhjbYejwHv1wRX3NGN5KOJFPlJGFFV2
 b+t7ZvRtGC9W4ZRp5+flHEFIUWhRO/1Me4UJRvzxs2wfs169JiwAAAA==
X-Change-ID: 20261124-b4-qca8k-two-byte-header-init-60d7762968f2
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795484608; l=4136;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=uSCResecR5e/9XubjnoA9vw/Z2JIzLhyVXQwnSf9+wk=;
 b=MIGsySmIWqUTbQBiZq7Cy2qlQ28b0IFD2bHaE52W0juDjOglWVzMm1BZFmZJFZwitGaI6YaMn
 NW+/p52dFYYBUK6n+/QCk7tNLxaeScM+moHH4JZK+DQkR2zwnh5BXR0
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

The QCA tagger handles two-byte switch headers, but setup only programs
per-port header enable modes. The global HEADER_CTRL length selector can
remain in four-byte mode when firmware configured it and no reset GPIO
is supplied. Software tagger selection then disagrees with the switch.

Clear the global four-byte selector before enabling CPU header ports or
registering the user MDIO bus. Preserve the identifier and all other
bits, and abort setup if the register update fails. The register access
uses the existing MDIO transport before an in-band management conduit
is available.

Both ISIS and ISISC document the length selector at bit 16 of register
0x98. This does not add support for the optional four-byte protocol.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
The QCA tagger always uses two-byte headers. Initialize the global switch
length selector to match before enabling CPU header ports, rather than
relying on firmware or an optional reset GPIO to have selected that mode.
The register layout is shared by the supported ISIS and ISISC families.

This is a standalone generic driver change and does not depend on the
Cortina platform, Ethernet, PCIe or board DTS series. It adds no new tagger
or hardware offload capability. The identifier and other register bits are
preserved.

The retained four-byte state mismatch was identified by source inspection;
no four-byte firmware failure has been observed on the Almond+ test unit.
ARM W=1 QCA driver/tagger builds pass on Linux 7.4 and Linux 6.18.64 with
the existing upstream MDIO error-handling prerequisites. Source-helper
fault-injection tests cover the early setup update and returned errors.
Full ARM kernel builds with QCA8K built in and as a module also pass.

An instrumented Linux RAM kernel on the Almond+ completed two QCA8337
initializations. The read-clear-read snapshots were 0x00000000 throughout,
with unrelated bits preserved. PHY reads, MDIO recovery and real MIB byte
counter progress passed, along with 600 byte-exact ordinary DSA UDP echoes
and 20 large ICMPv6 replies. The watchdog returned to the installed system.
This covers the existing two-byte path; retained-four-byte handover has
not been exercised. The source-helper fault tests remain software tests.

Target net-next for now: this is a source-identified initialization issue,
with no demonstrated regression or stable backport request. Maintainers
can reassess the target if further evidence warrants it.
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 8 ++++++++
 drivers/net/dsa/qca/qca8k.h      | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 382753bcc..15b97dee3 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1865,6 +1865,14 @@ qca8k_setup(struct dsa_switch *ds)
 		return cpu_port;
 	}
 
+	/* The QCA tagger uses two-byte headers, regardless of firmware setup. */
+	ret = regmap_clear_bits(priv->regmap, QCA8K_REG_GLOBAL_HDR_CTRL,
+				QCA8K_GLOBAL_HDR_CTRL_LEN_4B);
+	if (ret) {
+		dev_err(priv->dev, "failed selecting two-byte QCA headers\n");
+		return ret;
+	}
+
 	/* Parse CPU port config to be later used in phy_link mac_config */
 	ret = qca8k_parse_port_config(priv);
 	if (ret)
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 956338893..4740fcf39 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -149,6 +149,8 @@
 #define   QCA8K_PORT_STATUS_LINK_AUTO			BIT(9)
 #define   QCA8K_PORT_STATUS_LINK_PAUSE			BIT(10)
 #define   QCA8K_PORT_STATUS_FLOW_AUTO			BIT(12)
+#define QCA8K_REG_GLOBAL_HDR_CTRL			0x098
+#define   QCA8K_GLOBAL_HDR_CTRL_LEN_4B		BIT(16)
 #define QCA8K_REG_PORT_HDR_CTRL(_i)			(0x9c + (_i * 4))
 #define   QCA8K_PORT_HDR_CTRL_RX_MASK			GENMASK(3, 2)
 #define   QCA8K_PORT_HDR_CTRL_TX_MASK			GENMASK(1, 0)

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-b4-qca8k-two-byte-header-init-60d7762968f2

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


