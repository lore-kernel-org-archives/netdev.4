Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132741;
	b=e7HVHFD2dEd553qou2Xl1FVgNb6fjpekRtyLD/5jl2lnLaUvHaNHbvNtw5nOzwfK9Hoe
	 X4iVfWmMhs5fnvjZPClI/6ib8OupgI9x+VgW3n4W/c+AgNAUioMBrWQO8Mtg27fzsFGJ8
	 HERfuBx4tvJhJAtAzWMLaTmxt2UXv4YNC2xTrYJ0tGTspA+Zk5pevKlatK1Q4j4haBK0/
	 LIv1rBshMQVhYpznDanniVTuT5lwn/Rf/B7RbQwAZRTk4SsfpDx3RCWnzRHXaCub5atOJ
	 Xj2+oKEkjoCxQEE97TOSekgJNzSiKdQmoEu8BO1rsV9vRoSWz0ox0C53nfC1O1MVoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132741;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=;
	b=YNmWCcNXXnJvRZwa5B0AgBFXtpwmP7vrncS/lZDc+kh6wVz6PO89ERwBNnc9NjL2yMsY
	 ZpW8tDpTAl13WADz+Yln94DGgzpMo86mjSXdiobxmnacfKfQwog6gWBobmwvPx0WuZcbt
	 okFIpKl4cdJJhgXz04RyuIrBFYgWndnjfvpI4441QVt/SSbAifxPcL62u3GU0UTlC03eX
	 6Kvz8NTALzrPnFQ+0noYqCA+fG36y5bJTAJM7u2xAycuiLmpDkuL56x0B1qqzFg4pmheg
	 f6WjF5szVbH6M8eurSYUzaDCMeUtO9i87SFk/8p6GB+I++lbf6VWTyjywGP8Ypfwg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=KXqPwsi2;
	arc=none smtp.remote-ip=66.163.191.205
Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4DC606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4DC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=KXqPwsi2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132739; bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=KXqPwsi2sXrB4r1hdw2cVPkh3cIwiSTMkI/3P2pPtqdixAoLbfczwqCQZRrjI5jhumNvNNHGLCUZotztSYMZTlWZg/CmTzGo1Hojlwag3v+l3OMRuJiyluex9tvSK3+vUd4chrEtPtcpGY1cN4W0/xBE/oFAqP4+neHmOAyiT55xjxu2e0AQ+L/5jgC8xupOpzbOdhDTrehrPQj0X7CoL0yohWUBAH/5uNe5BJEk97DixeN1vPU+CWoLEMGyj5M1FFtwUnuOlXhVKvYGPxOiwzpqaBaJapnGAbM4bkJuyWgOklAyxznk5ftyCy52a3pdTbV1HVeSq79aO57XxkdxEg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132739; bh=ENQz3OLquRyqO71tzD5ZThjtX+3utzCJvVOauveolON=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=MtGmjYoZmCTDo5g3oUlKsswehN1y4XkK2aE92dAth9tzmWoKkEYHicttBwD6EurbFVsAHgu8dSregKVNrb0Jmi2FW6cHj/QfIGb9CyQ77q1MD6K3Wk7rN3GAyYUrF5M0lnwoj23QKidRqn/k/D1hSkrgTVaL6aUmUvfkIsQsMLtGQVwJlcjwtCAzyOQA6S3wB7rYGgTA5hHjaBvIJwjsWyAZJGf78EyJXeZhNDYATHfOa6bqIpUjW/l9xatYv0I87ZnrXC6WMmZYU47EE0gYAoYLIwOdxSOQ+cFaq/Ee7/EXUYhRAHH/cNn8jAosckOmpJxvK8jwSgPsYePZwSZOpw==
X-YMail-OSG: zEIQSQ0VM1ncEuhqVVdeVTw0Q3MM9TI2Jmnu8zJgJjCrrc2KUjw7Ny3XlEmYshP
 Nnam5c6bVE.U6oJTtCQ9u3O2jTe.7.rmPPEGZQhfHOJ3Hgtf0HH6LAV11c48tByIoyEkdXV4uiuc
 QcOrYsREXZ0nT5qIUTI65TyOjl8d40xRXGOCmE7Cj_D4HlWxWfQwRoTrwG.KtBz9owtjN7cGPo2q
 RsdJBQzMlm4Y65.IqKbt9xK1Sbloqa6.OFmF2fPUTe1fd43iJm5UV56F9nK8.kuFO9HBCFWaLBpU
 oTpWu3BGJQsdU3kywSEno3vGfosHTkuYhNrFwackOUfYm.TAwI6BIzk2VbUZjusiy6tbYoa3v02m
 eyjUWeHK9ds7wqm_56aFyN8ZxnjqPEwaYKvYXCs7xzTbtwXfgU3pq1p1R9iuijwyr2G1HYS4fntp
 GXgJHe_tRafsQ4Iv2QfTUL1FIdd0u.H.Fy8fBPzLMwwn_fi3dQyDehxVkQxYIIKb3ECFRFk5Bco1
 00PyxNpX2CLYGR5Z0VFcBZTrGySb.NrNvWx1TxymppTagAgJmVhFCltsG5b2A764fus7GOXl1V6D
 oT077GUNuiHlfcxRhV_lFN2H4U64RoJ9B0iKcyuKUg1.RKtvWK2e8r5j.TTSYOO7oSD8xFcqoP.m
 cUIRcEX3tNPRkUUnaEWhwF2rMlL32qWudMc2UVeb6od5IBewY5CkmKZjeXmVjQT6b_btt9g.uizB
 q1ymdyzCigj5lvRg6l7SS0E3oqmkop1wR0CYhLJmnQ_PgolWRmeLe.t33FapnSg3om0kzKd6MbBP
 xr1fmDmiHHQ.l8fs2u0bBgQbgNZRt16Yz2vpbDjFKR8UYtKhkxA7.QAP5T6OiAT1_gxoXicOAimM
 KlIIFPxd4VOMzL7J_TVGiCHTlGSeda638Rx_PeD6bmPJsoh4xI8UsQjplmoWL55PsnjBjVReuZI5
 liA50eUEzzaQKmNAcrZYhf3_PCoNwNASjhwDViZz9OPwEnV35Xh_YRS99x8W25QNM3jM6FcqelK0
 vQNGOHPLWBSpgMW_2MPPJ7duvF56mIgcPEN2ITpnwcud3GvYPWrk4dPVEY3uK0cn9GAEKeLsxXL0
 Ygyeb6NAzDkEXQvq9bgTL6MsuEIt.1aqHN8pjKSVuC5O7l8f_jKu7eGdD3AwCzoql5C8nrbertzC
 yFiu5am1mOUrKgbZYNE8Hd6fMMaon49PzusqRplKKtjCgvD8oH3Iq9DOAVTy_SBh43vho_31SnJk
 VfLcdNsNnrbFzHcXfQAC2uQy.DSAEyXVSIi_WpUHNohsvKITvqNwD2ncSmFJh.Sp.pDUWhTXYqT.
 Qo48.rEYQcmiXyTMnvxaQUpXtsAgRFlG1eIt8Q2pHnPv5JFElDBq_JyQow0DYogyuMFK2ksoc_T_
 N28h3nJciG3qN3GMhOsTNK0p8AOxmB9YEQKEXuGk3JuMhWVUoP7QArLyDDtQRDChRvRNKNtbt7hV
 3VBfODv8cisTNRvse.YVgdpqNb5XR_S8qNCJkQZ5wCfBFnRy36EZIphryoGRNDoFbCbjg9.iuK7W
 C34quLTmtY4reWYX0fQZXKkEDhFCaCCZy91NG9lcrX3V58uplRGiXInP0WpIMKHVQDtxT3BKh43A
 pIBH3qPDq0GHz.rLXbA.QFZKzLp1JCIE.JeEYr4oAkrbfFrJ.8ndnQ9BGQHrJn8i9ecr6WJXSZKo
 fCe54SKQrWtjycJQp674dI3BPb2K4aHQ3wxn627ZZ4iB8PkD9EeyCEE6bGBzfqbI.V5x_HBrurn7
 Ru4pS4XI7zqpu2v2hPsqq8X4Xu.5DozN8sC63JBFjgSiNdfgmO9_XG3liW83BCjnqNgB.Pken0rD
 nSce5S6TPS1OFVayrIMYL0vwTwBgWZL9ze0mpUuP5jWk_jWi.gLACRQ76a1TWxAvc1nutwxiQbXr
 5vLLxfpKQ6jNTQp55qzg1oK1QfHct9c7pOadZTBiBbffJO36omMcE0JASYIegksyonTc6Wdxu8j5
 8Cgw4YwIWBZCfSnJfCGFqUeoz9X9oaIIocVWPK.zqTHoPSD.lni1iKmcTDFFa9qny7UvYpTOkJLw
 QEXJvHQnySHinVeg7VyaUtMGpKfP4SkzyH09YiKQj_pBZdnc73XwygWQ_QyOGaXxk.aAmetw1UfY
 QDEyTwcrPSBNEGytgCAYuUa1liiT_oF1hTbWXhHA57m2wT2sXTM_YFeDNhavzr6HzIQqi72Hv6Li
 ESAGvQVxXdEKTgmTv0j.hpzTjgqskAXvH_0aafq3YD8KZ95xSbxCHlNIK.lJQDSuwDZ0bqmdUGM9
 7u_tQMqLF5Hbx_2MTUtS9VbVJBtoG2rN4mivEJQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 21941ed2-1d62-4a24-aa91-4ef0049fb921
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Nov 2026 23:58:59 +0000
Received: by hermes--production-bf1-8768df57c-fczfk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2986f976d9dac5b514b2d43e112a18c2;
          Thu, 19 Nov 2026 23:58:57 +0000 (UTC)
Message-ID: <da69dcb8-7cb6-4c2c-b580-4e0bf687cbf3@yahoo.com>
Date: Fri, 20 Nov 2026 00:58:52 +0100
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
Subject: [PATCH net-next v12 01/13] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Language: pl
In-Reply-To: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

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

