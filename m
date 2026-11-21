Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252372;
	b=JMOfsb5l+/WyN4byhI4wtaU7yQzG72V9EOXQA4ywfOQS5Xxi7ENMdMDnVU4zovtsHEFW
	 +g1q+AOYHH/NC7t4clTEpF4sYNtZdfuRbZ0SyR6H9PAq12MU3qAXTw9eSjV/v7HFyg+V/
	 Fxl9JHVTdp1lJS7ui/qPYGZGf3dXZOQBta3b/EyJAw0dlwFXc+LLuSOLCpkTHK6QlcvVC
	 BhQ1pKgKdNu9QivPDlq1MOAq2NRtfEihf710py/adqPZCPAwki5gL1iuECHTZjxLKBwNa
	 8huTsNPz+Q809n8MeQ99Aqn574Dkkd0hGcI30j3X1RB+aYQQgekiJulGYOqeLNL50PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x2wI2DGWgtLPS/Hc6d4m8xkbV0mW64fjKMgg0xWLe9c=;
	b=44C0pyOAJknegYy9dC+0AEk9OtHTEexnITvUbcsSaA7+sY+BQKn2ZUdaiqeV7TODazD3
	 P1Tnit6EpJgPZEIInRSskrU+5VLSPC3Fn9zwuchytXaa9TV5MJn7UiyEju+vmQU5goQ4F
	 +qboDSGvk7VzGkVa0V0KKGWswkGWAjpXfYUEMWfEPAeGFnZ1466DsY3DddNkSDy9OMmE0
	 WPp7TtY2gq/WbIzA7zdFGe0+jESen13gjZ/SRyU7NWNMhQjjef1d0/Rdf6M5PN25RpTLi
	 H/qMdXN4KAJAq9Gaohmx2WWaQ09i8VWY6GEBbrNuxRHI+OykmK1RraG3ncSmfjWqdAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9o+KnlM;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2D606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F2D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9o+KnlM
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5133831027so250253866b.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795252370; x=1795857170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2wI2DGWgtLPS/Hc6d4m8xkbV0mW64fjKMgg0xWLe9c=;
        b=a9o+KnlMFQ4v/wcDlEM7uvhnYsA36jHwD2RFWJJ9evclgtkLldO393niAQqvUTSfBw
         3GJjP5JccEGTouWi7L9D0cfB5owU7L4IfgYEJYWxGFIlIG9rFxxNSOoKhQrgG+rUjE6/
         9IQjU3IDA0aWyO7/n28L/ocmxXTO9lbu6TnrAAXr4BEZwke8r822Qy7jgqHxqjLydUwb
         pnOmBKqwqScb1lZJ5kMFDhT5jPAj4U0LYNxgretvPyPQD0ZPn1vgh0t9cJrbPg0eDIaR
         APF2tTmDYFfd65BfiSQGxyR69qZ14DRppJLndATOkS7Ho97cPBnjeZSYBoSc31i4VfGP
         I9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252370; x=1795857170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2wI2DGWgtLPS/Hc6d4m8xkbV0mW64fjKMgg0xWLe9c=;
        b=bTTVioXMfYsWdzD4fl+2RlaID+GfzwR5dB2CUnmQBZgFkPkPN3l7RowHbx8064GIJJ
         7y28ddW87obCG4+X/wVFiBIPsr2/xcFDb1vRDzh2nVnsHAY1tZ6LGtI2rhxrUoTYZ4mV
         MlJAR7Odq1AGTAnxg0Zboh6ytocWTgUtzSyHvY3dy3J3XqOTAJ+8AR90zPStG/AfeyMs
         TCmwd72Jc19R4Su92RVBXi1KOpcqxqeJ9wYZQIuT/o6u+R3gk10qyLgvSAVe5S60jHeX
         kKJGMJTsFR/yHL6QAp36piiuYBlVkZ0ZkIdkbdZN2XLA0CNtjEHtFp4k3l/Qbgqp4Ivr
         /zBA==
X-Gm-Message-State: APuU4Z/AeXpQm3OAviMG06bJoef/smSIWYu72iBYmBPsRHs9AvhJLAVX
	dMZzPB2pbqOgg+VITsjKTm5WKsPYFFghAK1UEKGu/0UNZO/XcPMa/zsF
X-Gm-Gg: AZFdTZc01RWsngybCt0SOa2E+JaeI1tcJZeFoSMrOdjWHdzapEs7axe+6Ge8RqHJ3pJ
	4XXzaRLJiViL9zWP1qIueVa0C988uzfvYaqD1o1FOE/6+sPCK33bc1Y2MSmxPKxfaPz3nivKLC2
	DcvuWtCUbecpJqEq8jh7peeSSM4PW2C5T5jggU6//pZXwRdk7W1T70h9EmbZoNkNYqniN8aM3Dr
	nVNWdscXNJScUyjm3a56dQ0kJ+A3Lf6Z4+EIG3xTt1YsI99ncALJ1uMVFWriYl87Q12s3R/ENbt
	/LF59Lbd+hkPf3AG3SDsVkO+DdMIpxYvachKIrXzbG4Kpcfch3Fck5F2MUouwYgjJhlTcZ5/cha
	3aw8t0UUzzC/uZLniAk0jcQ1UmosNnUfHKFFmP5Za4HUQjSF70PqohUt/zSb099teptAdr4OAaz
	R7XOzfhUK7fxT/Yjg8GFj4G7JdYmERFipebRflSl6vDS57++Q7PULpbcLWkpTFzfa4b1Ft1QagM
	xeVdNtDMlOmCCeRp+uv8aE15rbH0VPcl31qhGlyjKcoiCO2OZAe3y1zah8Hw5dd2JxO0K+nBj8q
	BWB3dFq2R5GC2C0VwdY1ONTa7/3Kdd084WqHSwcIbRZyfO04JmtW/eGcVgG1PBskKPuHjXHBmUi
	DzshYfS1UfHXfIJoNAlbMbpL7tJ6Dv2yH4p9YbxBxdxabUOT/vq1e
X-Received: by 2002:a17:906:1b45:b0:c4c:f85f:aa2b with SMTP id a640c23a62f3a-c513a817fc7mr386047266b.24.1795252370328;
        Sat, 21 Nov 2026 01:12:50 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm178197666b.19.2026.11.21.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:12:49 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kabel@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next v4 1/2] net: sfp: move sfp_strlen() above the quirk fixups
Date: Sat, 21 Nov 2026 10:12:34 +0100
Message-ID: <20261121091235.1447291-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121091235.1447291-1-pawlik.dan@gmail.com>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
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

sfp_strlen() is defined after the quirk table, so the fixups that the
table references cannot use it. Move it above the fixups so that the
next patch can match a vendor revision with the same space and NUL
padding rules as the vendor name and part number matching.

No functional change.

Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/sfp.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743701..8406ad8ee786 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -482,6 +482,20 @@ static void sfp_fixup_rollball_cc(struct sfp *sfp)
 	sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
 }
 
+static size_t sfp_strlen(const char *str, size_t maxlen)
+{
+	size_t size, i;
+
+	/* Trailing characters should be filled with space chars, but
+	 * some manufacturers can't read SFF-8472 and use NUL.
+	 */
+	for (i = 0, size = 0; i < maxlen; i++)
+		if (str[i] != ' ' && str[i] != '\0')
+			size = i + 1;
+
+	return size;
+}
+
 static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
 				struct sfp_module_caps *caps)
 {
@@ -660,20 +674,6 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK_S("ZOERAX", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 };
 
-static size_t sfp_strlen(const char *str, size_t maxlen)
-{
-	size_t size, i;
-
-	/* Trailing characters should be filled with space chars, but
-	 * some manufacturers can't read SFF-8472 and use NUL.
-	 */
-	for (i = 0, size = 0; i < maxlen; i++)
-		if (str[i] != ' ' && str[i] != '\0')
-			size = i + 1;
-
-	return size;
-}
-
 static bool sfp_match(const char *qs, const char *str, size_t len, bool prefix)
 {
 	size_t qs_len;
-- 
2.56.1

