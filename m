Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340203;
	b=i2Rh4E2ge9a4+UdJzBUumwJ8hVoXxwNXJ3jUL68hY3dgdThn8hNRbvrqvM5MjR7hE3W9
	 XFO6iXFhlyKx9eDaIOQeePdFNiXKut2VQxTUW6xMx5OUFerSRRKH4Ka3pi/7ydIRXKXwp
	 8fv41VTCCKK63/Gwh/oqLVuwd46yQhSn3LnIzaXD9DqZ467QLNxuekZY73HYwQfUFPnmu
	 p/qLHz6+sOUk6JIEYuDD8+VRsaXv8D48DF0q9LW85mx4fUbL4GgqyFgmohzN8j+CsiW4E
	 0WNDIEpTRSuNh3NStUNqMIJkvi8JfXku8NvR1rKu5oje82n9m1uDxi7EH55sjN2ns5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340203;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=;
	b=hH6qN3awohozweWq69uejHyhT9WWYN/+eiw85EBIfpWgXg/jwYj2P55sQYea98VvH0hm
	 +aBxnoMvFIkxCosxaxL4JC5fCvfLelCTPJhsSxdfXN1PkvjYM40mzdgoZf91qrL8yA1Ee
	 vPuQv6ccqlwwjschlWK+EWowMehooFPWZopfNBcQZWSoUZjU7ZM4ZDBXCmfd+BQMSBqDL
	 146Gor4/iLzP8Bgw2kWk4dNTDa7SBSscuI1JLgc8dFAj1+cjj7kTngA0zOwEXtgv3dIdg
	 /mfu5TIKp47nQ/k7c0gzeh5ETXiP+w1/9o/Sdb+mCBLA+ML1IWsDiwQMOcqt3YQmF3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qFI9auch;
	arc=none smtp.remote-ip=66.163.184.45
Received: from sonic317-34.consmr.mail.ne1.yahoo.com (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F2606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qFI9auch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340202; bh=HO43C3iEXRa6J85xNlHDELJDyLp/RMlGT8/nfr+lOp0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=qFI9auchQj9z0+wCQeDIayrG9QqJhba+XblOKPih7qxaGzqaZsxST/du3RJ1muktv2yG24LgcwMBjQz0xErxahftGq/kbHcc6Y/VX4AS9JlHOw+rwiwBR4YMCjXd+EPmmOVclrNON8f6VjT0a9Wd1u7tttt8C/aZnYOb04LexVNYt2Va3PsXTwrz0BeBYTmUaWxV4kHoFHeRmZUtL6wNANPHbvdqeyWnqlh9pXOMXusF1GRz8gr9DouX75wnFC9eyvt8ycBfrbaoHLn5jWBV02WLZviWmD2W+KweDuPSxF10jEaY+AQ1eBxNEoyWJBNWZfnBxD6sJnscN7wSIxW6ZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340202; bh=amFclWzzKXyqP1CV1drAjTlE2i4SfkMLwUPFRxsLt39=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=ZSxs2Nj0SkOpkuWq0zNnSCPLy22owz/WomsQzTHidH6fJPm9Iknxt+nRBJXTXAXRwpbaw7Zy9O3YkCrslPVBIp5Yz7eASPY5yJp3y6N/K2aZS3Ai7WOjsuZxGVrH5ntNuoPA5or9JI9uyKYmhFQEXEfQMMogsnP+idZuesNK/xb59AsZSFCGcwdjtIKY9M+S9HnEb+ejAuzktNfvJHsQlF0NfeNSZVZdILhOjBV8CAh7guGYHFWHcWxkVzD7Hn3UXsE97oi34foNXTmnYHeDfhIDGyexLW7IYqQ7gnC3o9RI9FC8R0jhhD1rHJ/slgqoQoRZyxWvcSns2t8byKR3PQ==
X-YMail-OSG: U7xlffIVM1n9Xw7MbtgvNvJsurWscIeMYijce62Cj6xBIeK7YZUSwaEFkdhtFdV
 4zqbnnByKITYSX3H.QapHL7xXtim3TEe79JyEbfmZv7jeiv4gwcuJVjYgRttvycLc8BDAzvohvqP
 nRwM0SE.sbvNOQX.P0iMdQDLA_GJHUh2DC2ApZa.lLVmAUwmYYirYBEb9cnPDkJXOxgCFLnbBvjl
 6cew6DbTAB98jY7UJzBYAVYm7Jd2xK.kJrBiU2DzqS3VX5nhfAXP2jf0pUat5tClcD5VuiH3soVL
 T7vMt.WWtZJDtBtIkPo8aSfuLTrWmEWPunSVuQlDX3Ve0882LA_b7SCAOZZSBWTy_AWchFRL_Tgs
 rCvJEPv5wV8gHLe70pr3PYlicbRtKIl706DOIp76NrE4D0wFvyqj.kxwDVTTTJmoP3hk6cap8HsG
 nVs93_z2qpuXVR9zzBEBP36Btb5sBiILjqgcltuIk3.WBLbkTkHgUhsS6Ozp8l.aEX72CR.3lwXI
 wEh5qVKZ9K_o1f6iviSYKXTkReWxgB79kctFJY3WZFgkGo7.UFK3Us.5nEJpKRXbFOO93tjvlzav
 K7GqgqqQUhZPDmZoab0lS955R8.VoEVi1HhGfq5fAa_PHB2uNGg0QWMaFvZb_Z8XgrDh9u2BJ8iv
 tWtO5jys1gNQWixkpI7By2S4AF1SSJBRN4inAdaV0vnTazzUxAjeB7MbivW42Ri4yg.XutZvtnBT
 E_alXskkM7l8rKp3ahy_62uiUsfEWlSEhciUv6.3moFGwlDMmsaVrPXNUDHcaD0nYm7dLPQ1BPYw
 wU_nBZ.7BCi57tqPAqEAuMqwStty1UGXxD3iruUt1TpIFGrvz9F_aLIjdGpJ7hPiOCHbVavszzH3
 r3aINgNQ0S9PL5Y4KXrxPhPPXDnXIGJyFAd4bn1m9dpELxEm_8Zs34rc1iX_K9lKjM1bcf5g2tVQ
 0qeQdmt7GNFiCISeygqtY2R2Ztj7J8hEsJoPBX5FW5gxC7BY8v8vShD._LMT27gSLj9__4tv1UbK
 j.RSvKMaBf5JNnuZkZfWM9ivk6.38Sy6Fw3zlTmpKLfYGZf6ZeuTQsQ9eV8g8np7EplNHYwBgXXK
 Pm90UqP5R87g48cKZpXe0RmQrBTyY1klljePZ2ChmcfdGMi6Hy5IN4jK_G_ERXsKIvlF4dHReWzi
 1EgUJ8vRFKeeXGGgKeabY8o4M61z.FGJC48V4jSeRBqyR8VLa2un2INnZqkSOsxju4DJNz5Queuz
 N4mDCveJYczpWuDDyNf1JDNW.KWzovY35xvTqUZMysRq8nRszrrfChyw2EZ119MZoiChGHTpF39j
 Veg1Zi3jt6TItHnOWKPwTNhkcaHKYgmSPSpLhFHq4qu9TzLYblu_TO0Ziu7rcXDFA1yD5dJTwPBx
 uNaXwPJFGYCVw85iKAmI.edBls8Wjy3DkZk_Iu6.fgDJtOzPhiZKaqWa4NAdNlgLomWUZOk050zU
 fUTQfNTOX2ngr0PX_cUAJ7ANRp7QQVh51J1BEzeClaYF9Z41LJZSiWCeopYVO5hBpbs4BGzutTzc
 Zkpi.dPPTgf59GuPwk0NGp3Tc3AWB8XN58ngyKD55O3lWsKVVShg8YmucVzARnIZvFZvqCeXfko1
 kisswCCuLiD9xHxrJiRZoUkwQ5plgkjupg7w6Djbcaz9TiHWE58uohl16Jw9ss0KyQiNV0WRL.MJ
 GBHQwVY8UUlAMMRgPlR8FUzWo4_11tTOXEkBjGYS0.oCWO6VcISOBu09EwlvnkHSVpxGmcc4a3C7
 oJGAKjMQ01smVqGv6XOvVoBDDxUvDZ.jkQ._GacVu2UXhUUIW6f.ZbsRW9MGGBPJX_uQICpZ5J8O
 dcoNatcy9yY0CYAGHhXDeji2JDcSrl3_nk6BLXoMQAOgHErQYWd39fnv68.M2nQh105L6hraJS77
 6ULGCHgCoUWHX7uYq8SjYqSOBr2aROhmo6nCucltj6S49M1_kjj7wNGQS4ONo1R5IlJVobdG90Bu
 dmreLvNjWbvGPQUcN4LRtfKdh0weV_3nDfx1lhEs9LvBpZ3P1MjQtyBI8CN024QjX_2O6DHA_cZ4
 ayxH6W6orYhga4MnqQwLyOO.m8DbcUsB8iFuM.zpE0iyXTMHproA30eYMKGibRLtG.Nb6d_tyMIR
 nK_8DXSn6h7SzfreqbNT6HcfCLPVrQnFGZA21X7N7s9p4p_TmOT3uULBzECXbx64IpOYfFBFuIr5
 JMuoHABna9MZJQvdzf.HxI_Qfj0SQOQ3aYGOsWz8K8saYj7BXXTZEHaN9CBgDj1dNoaow9GahrgB
 Ag0UVyE6VTJyqqYib08a2UD_8t0TGXec14JADtA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 683f2aa3-7a9d-47d6-a89c-58eb8983171a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:36:42 +0000
Received: by hermes--production-ir2-7c4859dc89-622bg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2a4ca4d27bd86477586decd0d6d230e8;
          Sun, 22 Nov 2026 09:36:38 +0000 (UTC)
Message-ID: <47733178-496b-4a0b-9e83-73ebe6919b54@yahoo.com>
Date: Sun, 22 Nov 2026 10:36:36 +0100
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
Subject: [PATCH net-next v13 01/14] dt-bindings: net: dsa: realtek: add
 RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
Content-Language: pl
In-Reply-To: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
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

