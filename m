Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160355;
	b=PjJOv0uxnmX+65Vfnvvvui8YTPNmp8BBlcySkz91DKYWI9wtvnpGTsd73FN0vSHZKJ6/
	 MG8t5VyK+0Kq+BYlISrmEeuOOKFPGeFnx7gR4y6R4Ew2W3JhVbdqX0nSId5pSwzPKuhRX
	 GE3Hk340BzZ2N3QBtQ2h23IR4nsEVqGhyHTehYH63JxXoKYs3ik5qEzbQ+wmdL06kmS1+
	 RKaCWpZZ6LIibpXw1vuCBZNOZSKqN42phOhh02LTR+2WLEQCqvfk63wnmZvIrtkPRKaqH
	 Vau0Aysrnaqzv4DPaG5TjSepQjCvFEALb2k5D8Zy2Env/ARCaH4yzGjfzQzqZ9kOalg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
	b=3hsL2TpSDStRY78hYAntj8IweiZFSrcznoHhORZmdrp0yZTPueKwmeBALesf9URSs0OU
	 zJ2YGJAjS7W4yPOf7loRS5MwpZzpGxhSqwBIj+uQuapu+KjSJC5JnQ7makLWbi539XzN0
	 qX8J7Dm9J23QIajk8gu8JSi+yhF/MZhV6mwFt/5LpnyRvTltUPQ3qrjhWeqaG3tNlTfmH
	 1BF+zpEA4RRTQ9ab1DXtv8A/gVLCBJR93tj7DjMJQfirdBfBaVRuY26buEwuuegDNVYbM
	 nGCQTFI8hqHyJsgVrDf4su09F6q+FRFds+j95ObWZQrcj1AnXLVsYZ7q25mdzLbxyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VPDbLo1C;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DB606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VPDbLo1C
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4090605e9.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1795160352; x=1795765152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
        b=VPDbLo1CJKIq5TgsAPCEdMdcA9NkYuBQ8TvEuE5FC+GCTgpWIKHAIrJsCim1NhKHoL
         MgGVVic/Oq79qHixBRsoJKMtkqbr+a5MHr1oR0tqoqXLdbRIwQApLLSFz2tKoPoLwucV
         nCZhYsB5ZKoJrqWGbXQSHBQUbJgpw12nJZOPjMs4xWAk1yNn1P6LZs7xM3nqJONA3nC2
         49JkSaN44fpOU7pSfDS/U4jjhqambIWg2pqlFiJmk1dAiqvLqpWBc9QGQI6MJEIGjZ1X
         Ew+XpiSTFPugIf/ciO8iKIbvbZZ/9jlTwQPLIG3wffWgZqlzUZ+Jhawd7TqBVI0e6cES
         RXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160352; x=1795765152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
        b=tbjrNwbdwxKTPGyatZdOR1u6pCdQIHnT6aOZqB1tGxLFOGHu590cmkrD8qnPDESITy
         VdMs98vHHrvbDTT5rdxUQjMG32rztu0xkvnC+ll3HJqOtKrILMUfRLNyLT4daSeP4v7s
         xtc1rhciJmXHoJiJzR5rt+pgOanHb673GDAlfviEh2Ex8fIKvobouk6mHt7C0XL/mpUj
         xJ4pKJLlY2ZSustOeEhMXh5weT96gf21zH5tJnIPaxrwbdgSirzEMBa43cQaGKg+Kf6N
         YcMmC2IJloGgd+XvEdQnIMArBaWz1EdxLc43qwoGDMqpJwU1YlVesoYRIG3jtq1DTuRV
         hi1g==
X-Forwarded-Encrypted: i=1; AL+hErH2qGJrtDJv3cnhHk/KNYo6ZsPlbeKmF+cZ/Mz8TJeOJ96XIKwO3wnXCdx9frltmnoOJiKU304=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TT+x3CDIXki/2p/nbNHFKjZ3+5ai33TkhT8QmUzCiKFhqijor
	/revP34q4nBPXvTLygtQABG+K1Sv9UU+4SwCjwwolYtSXkzH4cbXUaQVe4euaNBP6JM=
X-Gm-Gg: AYBFou1e5SIxcmRQrtwhZHH3FaV1JXX4VZn95MI4fkQyD0fJvRv4czoPHlGaQQsNmn5
	+iyy5cw9AW9sW3JyAYqWenK6L4ebB5AR92ShdyUYZ+8W3i5/G2nE+f/+IbJGVZWg9IhMUKLgtdr
	YaEKd9oLSzSnBPiu2g+3kSr6KLAbmQn80lKjwTjpvK+MJdjWsHIpkjISQg7v+rgu6g8JvT59H07
	C87MKg8LeQd1HhTx08E1gkyFzxee+igRJ5QfhOFxQb03H0PagShMPA4fq103RdxzpnIv7W3zMNj
	Dt5tHFa85xIAdZxSHZEdLsWL0NSHgbQlAau9vekLvHN8M6PdL6fn3ZWbChC5nklcSgv2kEvwIVi
	Uuj3ZpCGrnL/4pwqAIQVkMW0569MKBIml5wuWZR0Hu8nX1bIXt8lXfWOJvJy7Yta6xukTFVjBil
	63lRUeU2FQttnXDLF5Ph7AyOerDiGwaP4h6+6Itr3DEBnBIVDN+gS8YRYIVBgUt0E4QK4GmgEIc
	H6Tf/uhe8YoXPxru4sPFrpPEUgkqWrs3mUxq6ZeXGgyU5K0sxmkOaI4TzElCoiRfZV7OswHwXtz
	Lg7ghQlOB9my1sX+4gHW1VadWsRKJKE+ll/VbpCyGomX1Uzh4xwr
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr50112675e9.9.1795160352369;
        Thu, 19 Nov 2026 23:39:12 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm99786745e9.8.2026.11.19.23.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:39:11 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Daniel Machon <daniel.machon@microchip.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH net-next v2] net: sunplus: also fix the byte order of 1c:50:1e MAC addresses
Date: Fri, 20 Nov 2026 09:39:01 +0200
Message-ID: <20261120073901.21656-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
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

The driver reverses a MAC address from the OTP when it finds the
Sunplus OUI fc:4b:bc at the wrong end. Newer SP7021 chips have
a different Sunplus OUI (1c:50:1e), possibly stored in the same
reversed order, which the driver does not recognise. If the reversed
address has the multicast bit set, the driver rejects it and uses a
random address; otherwise it uses the reversed address as it is.

Handle both these OUIs. An address that already starts with either OUI
is left as is.  On chips that used the reversed address, the interface
now gets the correct address, so configuration tied to the old address
(DHCP reservations, udev or networkd rules) will need updating.

Tested on chips that needed each of these OUIs to be reversed.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
v2: Use a helper that checks for both OUIs instead of an OUI table and
    two loops, as suggested by Daniel Machon.
v1: https://lore.kernel.org/netdev/20261112123738.429728-1-ag@ffroot.co.za/

 drivers/net/ethernet/sunplus/spl2sw_driver.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_driver.c b/drivers/net/ethernet/sunplus/spl2sw_driver.c
index 9ccaf928ed66..b5ae950f6d5b 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
@@ -203,15 +203,20 @@ static const struct net_device_ops netdev_ops = {
 	.ndo_tx_timeout = spl2sw_ethernet_tx_timeout,
 };
 
+static bool spl2sw_is_sunplus_oui(u8 b0, u8 b1, u8 b2)
+{
+	return (b0 == 0xfc && b1 == 0x4b && b2 == 0xbc) ||
+	       (b0 == 0x1c && b1 == 0x50 && b2 == 0x1e);
+}
+
 static void spl2sw_check_mac_vendor_id_and_convert(u8 *mac_addr)
 {
-	/* Byte order of MAC address of some samples are reversed.
-	 * Check vendor id and convert byte order if it is wrong.
-	 * OUI of Sunplus: fc:4b:bc
+	/* Some chips have the byte order of the MAC address reversed.
+	 * Check for the Sunplus OUIs (fc:4b:bc, 1c:50:1e) and fix the
+	 * byte order if it is.
 	 */
-	if (mac_addr[5] == 0xfc && mac_addr[4] == 0x4b && mac_addr[3] == 0xbc &&
-	    (mac_addr[0] != 0xfc || mac_addr[1] != 0x4b || mac_addr[2] != 0xbc)) {
-
+	if (spl2sw_is_sunplus_oui(mac_addr[5], mac_addr[4], mac_addr[3]) &&
+	    !spl2sw_is_sunplus_oui(mac_addr[0], mac_addr[1], mac_addr[2])) {
 		swap(mac_addr[0], mac_addr[5]);
 		swap(mac_addr[1], mac_addr[4]);
 		swap(mac_addr[2], mac_addr[3]);

base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0

