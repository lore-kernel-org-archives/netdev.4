Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823842;
	b=mzfX1ZnvcJ2dgDK2yOEEshHQIDbKKMbElYg8P9ByjM7FtJnaeDO9svJ2N+HH8CEpDhzO
	 y+yyyWK10ipTI9oJ01g6dra54bAwTQhgroCZnU1UGGDYrLmD/nQ9EInmDV+vfyXTquV+M
	 eEDRLmMLRZmTMOdrEW7kswTfk8d57C7QFz2ckEMeuPnllil7xQTXkGDIiYFpCGZYqUAdJ
	 ojArAjqsNgWoiL2puZ2JbAvFpcuZKgBYdZPc7Zv4OnHApg5LEyFQSUlY5ST3pW1GitoBz
	 nNwiTqumFFqs5CXEV5DrELde03WScvbPgoRTc5CDIjYL1d0duN0EfZmFKgj6Ud+zROg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823842;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=;
	b=kbP2+TsOyz5zGynGfqoTQin46BrE8S42CzXehNcYJHWt/xcMF2d+8VfJuYsSvWxhLsl1
	 BxKPBkiLPRkCBQqJbLRgJja0ciEhlqFKKTRbLqSG1eEzed2/3tbUtQ56GbfIfI0m7PUVX
	 AUiwEpieZkg2Orqn5IHRKGaDskfl1B+lTWaFnMpS+QKym4IUfEhJc4v+U/8A1xfAGiemV
	 GXy3h3M9IQ7sEUnZAR0WcpSi+KB6YkK22CP5jSl5ZOgTD5Rlxegsaj7tReiI4y4zMUA7i
	 JaMJOp5uVSY+PEMHP2AI4ZY7BpId6fAMnNFcfcEb2Db9CAneNopKScR5/qiCRW9RfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tp2YXzLD;
	arc=none smtp.remote-ip=66.163.184.201
Received: from sonic301-32.consmr.mail.ne1.yahoo.com (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC51606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tp2YXzLD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823840; bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=tp2YXzLDqZmFIJzPj3vjheqezCUhuqU0GZ6NUSkeWzkbmm0+4OHE81EOIWRBKmXs2BQoSiBgR3xA8WgOFD4hNoYMLuPtR/OxCyZS8piIq5ff4WUUsKxJgd2BoQwsfDR3g7+ZjCGeEbPjqEZejut2B7KZqbujat2FfLMoxy04laH68Sx9snzOacX1oZyYKcnfv5asgabfPqH7Ul78jU6Ml7tQlkFpfmilcSh1DVfBYcr47GqPrHsKkf9G0gdnTwIpHi8zvbc34C3/ti70xNBv3YnMnZHF5wwTO6aYrDKJfl0lM/unZ5O3pTAemlu3o+dRptFSNZmP5ctT8USErUlf7w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823840; bh=MkX+lA8moFHyhHVzRlzI8VeWpZVs6ahbgbt5LQVmTWN=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=DBJF0Kta7svIOCPKLhtjbPx2vaRJ/bJZdlzyuVTVf9t3nfQwpvJf4jUXE+TkRbLV6fu1ajRqyx7cZluDEgvkSt49FYppblnkAT3TMQK8ztIXMk8ao9LhpX81a7N4OmdOA6gX2qJeh7034CbTj7CuzJelkrIPI0eA8/U04gEBivRwv4H5PSe/+YP4AQxnFaYcgZgcPSrMDO3quQl9yRSXZjaarzYEbMMKjGDa8ZDRziYA7n9+iuVEKyzVSkgAkL8d4E+wI/053beoxcT9XDIF1vIeAw7bLfXofmXkXht1bvgkH6UtSX/8YoM2y2TwBrdYQ/FBcwXHqx+m5U+YeyLqKQ==
X-YMail-OSG: JTF86dQVM1nE7esP7yk_vG4JYuawrkYegLTrJ3.TU7Sa6WXYhRjQiep0UXtd_Vh
 mcPplcdwdjeBQCfXmmmLPIQcSwNQT1fQZ1hwM1UzAWFMAHTfQfm_Y8iU2Smcwt2b18hPqO0d4D2i
 q9TfAolQptYzVx8mQor5K.yrScrrg.9.cCbMBXV_o9mtKHB0zwB7tO7GI8uMphVbnEXerJqai4Xu
 G5PovNX0Y9NEP1EItrAO.Q3VdHPXtyYGtyqbwEC2qeZcpqpftSYvNQTMeS7vC8K5UbRSJpGdtWbD
 ffdTlJhrY9dttoVAyimWUVsQe9.kOqFsy00pQynnjJBD52fscPvk6RNngCt8bCs9QeroD40BYjIy
 6RfdH7cA_3Z1w79Ly_G5oMxO9jo0DONiLPYzS1lcCHhVDBd7cOM4DXSlHMyJ1CCYSffXBIOxJ_14
 gkXJtUgd398t9YPptAUbaQmbNIoKVaizMANy_fXgztkOY.xy8idii_0pBw6cj6mtRPMNh4NwkRVz
 jPABknYManjYLTtT_ODEjKL9LMtcAMTLaO0m4W62WvLM9ReFo18COHhVasZBKANJkb_lhZVaCUTI
 bNw8NWAMaSVpT.xUiP8e8U48SoCDdmnwaCpTlldij90gWabGKWU.tcHGWj9tL4i6IDJqNfd3bXhy
 tFi35WMR8hWLWwQGsVj6pRTjRuj3FaKFHW2H3J5o8RrpNG4Qj9LJTiHWUcl4..BLe4xvs2KXXHCX
 1ARttBpPyeh31tlvRPoO4GtRlAQWwWz6Lu_PoTfQTPWs8YFAwxbKbd5qov.3Xnk8aNepTWSIQZou
 7j98DR1ON5MT2y8lO4spNrCssWpJ7JsF_B0uzhLLSXcCaney5RaalNF9PCXyka7qxU5Wqj13aOrS
 E0Ir_YDs5Ds72H8WAroQNB9nAo2h05JBBrNi4xcWE5wwEGG96LFZLITJa.ATUifLIdfBh9pxoqp8
 A80MMDmQIYh8CKnMFz01eur1_qhdJUGoz.l0iJdswioPh.Q5cydQ_R7n0_yWiWdPgvL0GcCMJ6a1
 YstnQ2uALKgYRU3fINKRmjeWO7jAAwyAJdx1_PHGssRTuMsTFejiOp.sNM01OzkW65j95qoLwxcV
 9BSksR_ROIiku_jiEsIBBlurevj2x4E2Xd_G6dgSLn7Y96C27bAV2n6ZtSNiYeL73aIOQ5tK5pMT
 pX0wmMBHLp_oqLoLprpl6j8OzsyOP0nqXRbq77hVDJ_zR6sZqzrCzrz5G_NB87rH_oJdfLmugpOR
 a4E5vf_3wsStqvj_4_Cz4AU8RR5Vfe_FM7zicsGeTFj3DAoz5cufhlI6YUbgeygE2on7meqKnD_a
 g5zM2weHNIiHbJvzi_y3uSqPDZvKwmeyg2EDBpOr0mrmCmxUma8Jv_75AisUX2lDP8gvqg14bQvq
 Kte9bxZwoZgQMBSffjLpv6qfhvEk.DMmeCYQ3Iuw0ZyooWC4ytCyfdMaimEHrxfrx1gxdOX1qMcb
 H5L6RNQ01u1ioG16kllfdWwmgW6JpqYFsZs9DcC8gtEU7jBbzXwdZmLLDoe8J3r7JmnLyNOaiM0w
 5GzFqY5QaF.xGPCcCorH5L.BtTkkz3RJ.4gOJxPGGNo51_UO1Zx0Q.meVHO9Z0MUqZphUqimFREW
 zGSQZ29_PVvCmZ50nBAJo0B72uAO8X3IDnvb.J63FxiKNGALNmIgWOrwUZajlcphoeYFViQxQbSq
 76FtNSknYyWP1sHnu2T3UhJ3iZP1LBDtCHdOmsWIvWZ2GMRgzl_W9sXFhBv4.BuOXpMaYRiorkx4
 mWWahgcgm95QXVWLjxTxIo7S8Deor01byCW47.2n8fO3now_0iwbwrIp_Rke8rhJ8r9AYA5E7o6s
 X_GNLVG3avb7I8hXz7_JeYQ6yv0tL4.7oXs5NL1FHPX7I0Nr3dkR8KbUYKW.FswMbu7aqWPlI7bX
 RDc.GVK5b9naNvIWp_vHqAvfqb31pUK_NE0bOz6kWX3vgSwadp0XcDQUsmzRzYvlDJurcgZq_m3u
 q01UWCEa6m3wWThrXS3ghM87WjBpz_xHWQWbpH4yV06Pbrs2xlJjXSO9Vw2UyLbMshlGKDrmGFSe
 TO.5oEh7qFBlQJa14YHFKPw675Ui8xfVxJxTeDmQc16vzT0AJVLAAozFLjphs6RcWanegxWUJY7y
 h.MWwBsC_f645uRG9xKoJErKRt.yRxkuaBXYvqN716QvHnJqO5pkKk2_3bq8QQJkCbrbLDeDeNz0
 zb_gHdR6SjDH_GEGhPyjlw6H98AehSEyandJX8AsYUCxoUVXCR26lW5L.RhETv2yDpdXucIZmTFA
 iatrF7dvjfkcm6OI53J7h6kvmowgFrWVq7Gse
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c6610b16-f291-4139-b1ae-668f29a62f7e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Fri, 27 Nov 2026 23:57:20 +0000
Received: by hermes--production-ir2-7c4859dc89-jbbfn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c171b0927df970e2cbdbef57943ede8f;
          Fri, 27 Nov 2026 23:57:18 +0000 (UTC)
Message-ID: <59c855b2-4e07-450f-98ed-7e89235de5cd@yahoo.com>
Date: Sat, 28 Nov 2026 00:57:16 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v15 01/15] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
Content-Language: pl
In-Reply-To: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The RTL8367S-VB (chip ID 0x6642) is supported by the rtl8365mb driver
with the changes that follow in this series. It is identified by its
chip ID register, so it does not need a compatible string of its own.
List it under realtek,rtl8365mb.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/realtek.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
index 473facd..ca775f6 100644
--- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
@@ -43,7 +43,7 @@ properties:
       realtek,rtl8365mb:
         Use with models RTL8363NB, RTL8363NB-VB, RTL8363SC, RTL8363SC-VB,
         RTL8364NB, RTL8364NB-VB, RTL8365MB, RTL8366SC, RTL8367RB-VB, RTL8367S,
-        RTL8367SB, RTL8370MB, RTL8310SR
+        RTL8367S-VB, RTL8367SB, RTL8370MB, RTL8310SR
       realtek,rtl8366rb:
         Use with models RTL8366RB, RTL8366S
 
-- 
2.53.0

