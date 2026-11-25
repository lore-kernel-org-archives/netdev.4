Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564863;
	b=k2sWG4AD37yPrVOX/Hs2kHkaw17wAX+ezzJeJyaA648kJVnKNc/SEe4vDG2wY7/CqfRC
	 YsPpqawcjcBvzBQx4PoahkeIUXMw1NjqK0HXA6scC/4KV2SaVTzAZBTKS4xuzJ5i6uDV+
	 3OjtgiOe9xPcALbpIFz58VLiEXQ+4LmyqHUR1AtN5hE9Yj0CqHvjmdgCj4B39GI7G5+sy
	 d+m7SEeMVHByyFcOLzw3Lf7/QzG3TpK8123doJRgHqnRIrrzXsrCsptMnMILYXN3lj/cM
	 fbXFQ7NOe994G7r58orsfvL1X9RjshdyrheHeZ80EkVwGJWV44J0P0omfeUWDsyp8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564863;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=;
	b=Ur9DSggI1S0Mc74Q2tjKt8VRWLXCOwoojnJFFUJRyPa9MwyFDBOk9IvKbwyzbTZuDyp9
	 qTaHlitteuQSU2vTmquFzo/Ukob5uNGKvIW1/t2OpIBFbISB4iUPmiJ4lwTze6W/C0HCG
	 WTSRk8wXv8qhyye+5q6/lYc/Ieze7NMSMleZHluBAtJrzQ2fVwDV3eOXB70ulHcldFrXi
	 ypFFGTXdnpeLz2sEyLYF5SPSOzTe05u9I80Reql+uqf0UPR11gVbrAR/mSj2ILThCEFZE
	 wz9xV9dpDN9yUgJgOxr88bbaREJcNE2dXf0ukiYRAauKhhfjIleVBAPZ2V62tiI9JXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ppvJvYsU;
	arc=none smtp.remote-ip=66.163.186.206
Received: from sonic310-25.consmr.mail.ne1.yahoo.com (sonic310-25.consmr.mail.ne1.yahoo.com [66.163.186.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A8606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ppvJvYsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564861; bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ppvJvYsUnXgeIEyiuKTzdfuR8xxcHFcbYHPxaKsAQk51bPvAZTfp3La7uZAvI/7f6dCvDasEZE6YPxWVDtg0k0SjA/fRtSttJcFosNJo/S3z3qPUwTtMjtd213zZ0np6aUKn9T9rqgqrgilzRJPn2OSz24kAH62zVMSqDr0s+mOKdmK4zdWWNwZH3XJNW4zoqVvk/BmCR4DB9JxJHAYZct8EBAav1P9lzzAmAbSVbcp21cLFdYsa92vFev+gdK+xCPByCTbO0v9XZwONL9PKcQJdIEfMZngQJ6+rVgi0S7s/Jrc46uyCEQfO0hz6ufVYxsL7KsRiCgtnvp20Sf2SVg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564861; bh=PeWKAYX0+XQk61oOxCrRIG0HAM5IlvQ0Ug/K3TGevZ7=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=I/gthpPEnuv1nCNXiP6hHeyb3Wz1MMks/Z0IFZcM07m865Qr0j19wXJzg8/zmLmLVKiQmiKspFPU4t2rKUqfqhrbOBJr6lRokpqW616IRq+S7OJ4jJ4Zt8th4lnjaeUpQwTvmpskPiXhcgXVjpzZRp58uAFLjoXH9/R2UtdKiSb2aE5QaFT21mYaZWkCpKCgM8j8WiwkcmVwSMgZGWNyEVe6l+1P9k/hu1hLay4A45/VyMl7r52hE17iIYflWmGZH3S+sY18TlrqdEJ/mRgW+zToyFiTS1YBdQL/r3JQITLqZwCdrE0absmt/iWrbpUNAFv95Ep+xJJGuWJRuxj75A==
X-YMail-OSG: .hHkHfYVM1l2z7Q1b85lN3inOQmSSk4vFjMAiS3ei7bCuvavVAjka2zoLMt2a1l
 2Jm8H7_LEzhBS.p8CU8QcSi8heX18rTeHVYC59DVSF6RRMxajC783_T6p2Iev8xWtyJRcaYO1xoX
 1904nA7Xzp6_oQjgwl4OnX2pYVcxEOnZ76UPq0.bzyBBNzVQ6j46bVdoeuoxKrNSUgvdwELQEVUf
 DUHWfOidCaSWRfSbmL55nDLknXHyXcLHT6B_nJHgH5td9oxWbyMAfrpnwB_2zT0YlTXy_vmeyGqc
 S7.SBQK_9d9tVbxN8PP6yQU2vcEr9PtW.R5sAD61ux1YYupeEguR4gx06D1A8oZ2wXgkYnpLbfqg
 JDHhrse0xX3jG.t8fvh1pmhkbU81WCOAHkgZkS6pisoaa3TLNqFbYic61oL.kZNMQ0O.jJdHBdqV
 PRYq0AywyXto0976qDtvEurbOFj2gb4rBFBknrn8jEpc0vV1v5QsEIJKfv9AY_VjSdbli3QnSpf3
 VeycfIlMh.1vHHeHsuH6pORukRjRKSWDVpxypRtVlBZsaKMnjIf7SVNT97FOPAQniGJP5biv56zx
 _lqISY8AmO6zmwHJ0C2_klmCNgWIaIKoo3NVqQ04pbEIyPUVSpBjZ4CUpIbyERBrXumwnK6Xs3L3
 UYNMvXRnIYZAd7dpUmbrLeznXsubNoSrx_w5Y59t39WTHt.WE5hv.BnQG96dG8ix9q_QJr91Ryoe
 zSUcHBPqL5JQYVHcn28usgb6pDNpPBsXfBzVDUA2zxkQsc8fCXEvuGKo3rtyghkm.M4UfsjWfrEY
 q7Ks0De32djbXOZbybh7ant41Zl0Y2f84wqK8uNWTWWL.MriCizBXJFFy4HCvYv0qeI1uMOrhoN7
 8EatRDLhqwU4kuQvvYyP6Ibilf3rYAsSl2zE.tKR8K8G2P2HhN21GJMLWRMhh_E4SkT6JSiVtKPQ
 3xV5Btm9bHr8igj3BTbOqrPuPZZnvQJqnAvbbR4m83Fyywbz.FQTFxCd_DbBJRIjyXcC2_G71zO4
 uzIQ6oHm9jufHFXGUiIWpSGYFrB3iSVBpbSH8tCG7ilNCRt.df8iHLrptDwZKeryzjUN1zRCgCoD
 IJbR_ilYYZcrgkjBkOYjGBb705OmBEyo5GaGDrZ2RoeTOPG77.iGVRLlABwuwT21aNVqigPYJJ4f
 gYZ5UDCaTJC.gGNGQEMf.FECeZb8zV4kt835CauZxwdL_O9DUzMTVzCbm2TqmXjq3q7H0aVmorxy
 PpWwzvF5j70.QT8ondsPj7MIYgrP6Q5OZXU3NImqRQQTL91wG5lQnCGu5MocKVyE2uCR23N0vj9l
 2L8jG8IfdvMbPL72to5pycWq0weVOlrUU3I7dMxndNs73qFA.uJN1Wm3Ji23jLyXq2NB5qVxIs5n
 rSzJJgwTKauRT.qd3NyIGH1S2X7pjeJoA9pgR2jX7ODBYldMXuGmYffcW1o.cBTVLvMI9jMZMGo1
 Dygk47pSfFxqNj5tMHg.ZXOMsd.1lUS321Vvtxss8zqP3FUsylwtgyoq7NYOOXkaZ_48vNcpMsp1
 c3XIHm_FfSHAo63F5OBSK5gK5Nto8PTecg81X4lL2.XYPait4LxtpmqaoigFUFzM8EZ.vJcbVT0i
 Pg.KfEDoYB1.89zI2ej1J77IsIFCWLiu0qsOZKtK4BkYigEcL747i32lQMMqtJZIhJDSl_fWahnd
 H.9qsK7EGv9z7DuBCpIvkShLXnGfPQ6daLwXGbtMnyP2iDkRcxc73YRDJ_Jf7kRjboXhu5lnHB1.
 Gasw9Ag36qVIP6cGeI2EAW2vg2rf9h7QsC36NN9riSdd33R_oAZxVoshkrh7TNB2.hC9_IxoiRBT
 yR9mlQLOqey.QkacQ0IvPRMAKukio5P09kqFRViX0hIXcGG7amDWnLPIgYVUhb.kC8kIw747EHSV
 qY7y2kaa8UKd.ekmCX1.r_tdM0J1grOWTQE9UK4Mo3T3EsL7SUViwC2O1wbwY7i.bfrAcwluQ6Mx
 3FGdy65MbwTE8BNnyh..M9j5QTQnCofmZyCGUXi4o7oHO9cBeA.YGQhMxCROxK4hc3QO3FGs0EFA
 veEj..1wUb8Bf3zr1Hn_e7qORK1b2dhj0h6uyaI5NTl_iK9wGO9gQueE9oXoU16lo11jA.OPsk9P
 YKt783YvbYlTQ_.IsgTkdW9upUQAnVlwOYzKHtVJKyRsxCrK4xqG2kXOXHQofvYL.rQzil4qlPjr
 RTGQoZAVC3knsLjyrK5u1vdryuwkUUEclQiIevQwLFjEHUW7EyBiEZgKOu_7r37sZwbPfU.MV1YL
 mzIIVnz1EeMXbdKQVdn.bUTWuXZpwWJ0BU3rn1hk-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: f95a7328-fe54-4c25-8699-34e9f342a171
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:01:01 +0000
Received: by hermes--production-ir2-7c4859dc89-vw2vb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5429e004a372f6b017b097db17ca6653;
          Wed, 25 Nov 2026 00:00:57 +0000 (UTC)
Message-ID: <eb0078b0-0272-4ee4-9e58-f3c54dfa44c9@yahoo.com>
Date: Wed, 25 Nov 2026 01:00:54 +0100
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
Subject: [PATCH net-next v14 01/15] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
Content-Language: pl
In-Reply-To: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
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

