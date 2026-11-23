Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445648;
	b=icZLQ9mX5RL7Ux7+Qofx1hQgJPeRGgD26h7ALEclKLc1ReZdkQlF7hRvcmv2w1PB6Tf9
	 qReikcnTBw9uv2iMRNIlRC/dqXTXpHrl5wZLLATcD0WyQcYTLb6DoR4hQ3oWNZ8wQCpp0
	 iewSRh732KUisT0/3Tf5SF8/R5Z0UggMbfDr0Y373X5Al0o6YmyMBEsKBAPJt3ScwSZXP
	 k2nMelPyhvIWlBxUGPzmwLnVCAnWvxQjCifz9eD+oHsfSyftG2VUaOSghaLHDo2sudjcF
	 vk5ZDoxS9zCJxJZ796T8Nm5qv0mZD091MraHNVFl/5SRrCRYHfHydcKAiQJzv4Z4RrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=uxLCR45VIz+tn/aUx4g18P6/+6NyUji6kuEOwzHQjiU=;
	b=DSaht9yAmIB3+63trbVO61pLXxsXg9fLRrNZeFW7LzJFe+N3cSYuM0byup8Ydz14V/Yi
	 EaamSEtEmi6k6ihAYSEEWyZYgVRj4l/kW6WfeEUj3XqNAvHfqPhtz6wsOn15ek7CPtU/Q
	 8ImQqdA4aLFJZwy1N8x4cSS/wyVkDhhSQYYbHpICgUuOIAUCpbuIuSxWPvvv6S4DfLRFG
	 tAVAYqyH9IG5KWOhecaK+OaujJqadgxVjh8hkEBgjd4tAjsUka7+IXOisi6GvlDL1UdY9
	 LcG9kXtNv2sZm/UJt6n9aYwNrWtR35KfgFoTPkJuFyZCJmxwaVQSEgB5njqSpPsDj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="Hj/zW8iI";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E9606B0AB
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525E9606B0AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Hj/zW8iI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795445656; x=1826981656;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=KOr0QuseXB2oG1CPzhEyE2cqvEepSSkfyf/zMYIvqmc=;
  b=Hj/zW8iIfIlbrrMM+vjwi3FHL2HHs46RblMeelbrRJupVCZWeQMTjZwe
   LFCRxu41XRGtvCr9fQBKrkMsTovFiMK6F7Ce9iuktb/56aBnNg7+sxwGq
   y0jG1qY1e4FPjALeyEwYuMJaWa2mxfr69h0JPbRE+JH3D6ITlujmQDZ6N
   P/J8JHoTry8MwALOJppSEu6oucJvWc7db6ap77b+eixQFc1+qxBTEpO/2
   QWXd/Oxq783+0pfdZ9EhYINWhvnXxqcI+uh+T0wpI5c/u7rzvmIwR2meM
   ry7SAyuSLNieOJ6w4WfYltvbzG/Fwy+UsR8+Cxn20oYzc2WOlThypX0SJ
   A==;
X-CSE-ConnectionGUID: XOLUE6NJScuJ/ChBo0fGzw==
X-CSE-MsgGUID: sJrYP1QZTdymQ2j2oF+gUg==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="233973871"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 07:54:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 07:54:07 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 07:54:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 15:53:54 +0100
Subject: [PATCH net] net: lan966x: fix disabling timestamping without PTP
 traps
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
X-B4-Tracking: v=1; b=H4sIAIFTBGsC/x3MTQqAIBBA4avErBtQI/u5SrSwnGogTFQiCO+et
 PwW770QKTBFGKsXAt0c+XIFsq5gPYzbCdkWgxJKS6kaPI0btH7QJ4+WTkzBeBx6a0nItd26BUr
 qA238/NsJHCWYc/4A5kefGGsAAAA=
X-Change-ID: 20261123-lan966x-ptp-del-trap-98dde01c5f7b
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran
	<richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>
X-Mailer: b4 0.14.3

lan966x_ptp_del_trap() looks up a PTP trap rule with vcap_get_rule() and
removes the port from it, or deletes the rule when no other port needs
it. The traps are removed whenever timestamping is configured with
HWTSTAMP_FILTER_NONE.

Before this patch, every vcap_get_rule() error is returned as -EEXIST,
including the -ENOENT for a trap rule that does not exist, so disabling
timestamping on a port that has no traps installed fails. This breaks
moving the hardware timestamp provider of a port from its PHY to the
MAC.

Return 0 for -ENOENT, as there is nothing to remove. Pass any other
error from vcap_get_rule() on, as the rule may still be installed with
this port in its ingress port mask.

Triggered during test development, without kernel modifications, on a
lan9668 board whose LAN8814 PHYs are the default timestamp provider:
"ethtool --set-hwtimestamp-cfg <port> index <switch PHC> qualifier
precise" failed with "File exists". With the fix the same command moves
the provider to the MAC.

Fixes: 72df3489fb10 ("net: lan966x: Add ptp trap rules")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
index 9be2cfe6feeb7..e3af7831a10c3 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
@@ -110,7 +110,7 @@ static int lan966x_ptp_del_trap(struct lan966x_port *port,
 
 	vrule = vcap_get_rule(lan966x->vcap_ctrl, rule_id);
 	if (IS_ERR(vrule))
-		return -EEXIST;
+		return PTR_ERR(vrule) == -ENOENT ? 0 : PTR_ERR(vrule);
 
 	vcap_rule_get_key_u32(vrule, VCAP_KF_IF_IGR_PORT_MASK, &value, &mask);
 	mask |= BIT(port->chip_port);

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-lan966x-ptp-del-trap-98dde01c5f7b

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

