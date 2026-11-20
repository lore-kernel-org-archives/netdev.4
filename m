Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156695;
	b=wR1iw0NY4nfrPyt4fGBMVTMW0seRrVnvLoNEHIg2IuYhimjEfvNU572c89FGYq/8I3Z1
	 ABKXX8Gez5SYNaoy4uqr24SiY4bOfkj85EZ6mp2cm338sSmy1JPTMscRwjCdYnef2XFFc
	 5vO/4lMAyVrTWERiRhsx/QyUpWxvZlf6nU5ofB4h1MjY80oU6nS6iVHGNhFrkLkoc0mx5
	 EWPxRztrAR+iEVWRk/zuYEaHYazUVYB2HpWbvt5Au1xtmKVNgickyMZdDtdppQt6YA8+i
	 zb58WBA6kXXDRgHnjeUhjxOXqwaNneVy69K0qq73ejVnVaA0rKsmFg9wm+d8Tu1P2bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MNZLAsA67y4XjqI7SXhLBivFSzBMSqpN47xurHueYDg=;
	b=WfaBi+tw+069CftYsLa0ko2MOTC64eNic11yyPxKvCX7G5ATwAEh+08hU0vVPDI2V1zq
	 PVe8Dc5LfW0QnCgObfIJDlcDLgFhdJqvSCbTQLXk99KXLYsselONbDKigifL8beYaK65E
	 mE3AN3n4XbyR6tjKYYQbossqWtolaYhLTP6+nBb6GlAeoOuoB2aHZQDxoXyrszCwdFVVB
	 Wi/hYVdv/OTnXUZOUytkDQtOZaEJW91j24ZJPAnhEL6Tv/RIPk4lv82W+xnBXl+7ARKRN
	 fAlGw7OXBQvN9OZ4f3QzcOqByXCCJvBxwlgOAqnxVYpWBIp6RJynHJnrgge85RwB4sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FE21ROoC;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0887B606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0887B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FE21ROoC
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c445c95d553so79341966b.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156693; x=1795761493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNZLAsA67y4XjqI7SXhLBivFSzBMSqpN47xurHueYDg=;
        b=FE21ROoChxw9PKKfXCvtExSCqIxqa5CSxX6c/TGvvhkal9TOZGj80wq+Cy0ExNlwfK
         GL1PdoFERXPjL2awstTCZpG4bcxJhWoclk0DhVqgea9fpbyP0qm6rzBWH0aJLhmorwtt
         gXGcVvdV9zhCQ2XB06yDjyf+7+N2MsS2+wRULw9A6N5NtvWvGfy1HTET3vY1tm3ycw5P
         AbxJk6+To4Cfh0xnoKBvXAp9kiGQclOeXxc5K3Suqyd+NdgKoK6Syguswk9w7WmjjRQ1
         2mQRjxVSEcaGeU5ma9rTqOiWdPB0u6mcdKfRe5fNnPEZ3uBgP18Mx9ZzTCGETH+Sfv6N
         h4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156693; x=1795761493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNZLAsA67y4XjqI7SXhLBivFSzBMSqpN47xurHueYDg=;
        b=GCnToMa4ty6Z2jJ9r6IX8qlMVzkU6tZS6JmnZcwE7pJtibOmgI0qJgbVaEFcEMVm2/
         iUvsL3BJhGVIlGFOiK2KXa69A6YCKqf/lL/iceUfXhIVSleG8/tdYW0FKwfxZYaA/cxl
         mGDyCHNFwZVVCtHnxx0WfBjWCPN4G25NkkBEBS4r1uQA32dqn2WURtVUWGIv82M1Z3mB
         156CW9zbeBb6wwxmk5HhxYY9iGifYZTZaDH7xBPWNmfBbA6DMKC4R5lTh6VRt2kJqe2Z
         p7hIyhZr0V4A9E3FWqYRYX3+qjxUv7qRmlDJMrelgPjQpd5s5ZJpV/4q8955/57iS5Ya
         GsxA==
X-Gm-Message-State: APuU4Z9b9kBWWBb+ti8iL1rQ4cn8w32+yLbDIlVRRi+02sQpYcPqVOeY
	I9BfKypxaS6+1w08f/7EdUi08XXSk0D8Zzs3iDQrTTLZh9QXxvse+moU
X-Gm-Gg: AYBFou14GnIyzDCIhqbE0o63R3WCk4FEz1nZS8S5PMnFIWhNkb4WzVGYJKtUWQwa2QB
	Qn7sa9ssCwPXOo/SJg8BW+8D3SGkfp7AdcDS/cHrMtIyEMFssnJ/b0u4oiWQjEQmqvA1MZul2SG
	gYm68JlYX2IFucxMj0L04pxMwBURpBD3cnsM0JGp2R02AiXR3SqBh6RCLX0Yq5LrLnePQjQttML
	m02qA51HD5+ksy+ZA2BqNOdYosl67Od02mH6cx/MgwQfGeZGEGOkcVK1C9+q6KGRLKDEeD5WflB
	FfPhbH4h/3XuwP3AVDg3ccGhYnfs948sOPIWwJji/qN14awIkvuTTw0uDNo2sjbV9eWJkY7DZZP
	yM4KsspMI0u4MFBC64fvPuExi7mU95b1GhGpBga6z9GvrHwJKSKYeBqUPHnTH/+jCSOuaAjfDAq
	CV/kj42mYuUpEZhqgzVcaYNvfWKeQsHwyiNXhOtOK2EgyOV5mSbIHH078kkd7RhtKBKmvDDFpIS
	/NRBjYRgqhAx+rUZjPAaZtNzcrLHDXJwo4T872+461Z841iJRY/CMVVWhAyy9hM5gScBaxNODdN
	ud+4ZjhxTXdtvuBMTHv1qM1rSCtBq9e58G8o0qPEq5SMwDcgSBdEUcG9xAOvL2wT1OIcr/c3f0t
	vzDqvhtXUAvg/1hSJ3lflGD6askC+cFR9yIh75RCqf2a1UNYccP4Jn8OMgvQkuiODrUSb0tGh
X-Received: by 2002:a17:907:3e02:b0:c51:49ee:6e28 with SMTP id a640c23a62f3a-c5149ee723dmr43400966b.39.1795156693265;
        Thu, 19 Nov 2026 22:38:13 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm66530966b.57.2026.11.19.22.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:38:12 -0800 (PST)
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
Subject: [PATCH net-next v3 1/2] net: sfp: move sfp_strlen() above the quirk fixups
Date: Fri, 20 Nov 2026 07:37:55 +0100
Message-ID: <20261120063756.3677554-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120063756.3677554-1-pawlik.dan@gmail.com>
References: <20261120063756.3677554-1-pawlik.dan@gmail.com>
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

