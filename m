Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794695272;
	b=IA0qTXcNHmU3Nd5aWhUdiNpQIfqjb1s+dFpqngQZGObdGHS2/RvPaqMy2IUDI44X0s3K
	 rVO8YLCI/zyeQ30YMnXfJDzhAegGYiCajSgZ7nItP2xDDpHie6TM8oRL8GdS5m0YLHdt6
	 syF6vpRATXoXxz5rDNl9EuDljRjblgmAuf6Uq8jDkt7gB8RB18lmsJCrydxuDNK/11gi7
	 wwtnt5IHYeoD8iZr3xz322xSGP/XGLBbyurQA+GCk+KQTmGeYX87RP2JGrldDGH7lK+/j
	 /eD6cbJVu/MKlMny0OxfCRcmW/EvF/yM18j/nW32GVdFWZU2tbijq4nA7pgoN4YQShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794695272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
	b=vPBIVVYmZQgxIyzA4Ah3mgfym4tddEyd5pFIyDTEL/VPNz9tpHomVzKMp7m7xHFriKoh
	 WLEFixY2De1/iUXS1p1/ZgXPcFdSR1SBh1JnFQX/msFWtHVET4HM2ZELD2DER5Ws3P4ft
	 y7xi+asiU4KKZHxYc3SP3PqpL1PNT/WjkFrWMu3YiPt3214Raz7F6fRYxTuE/+78NT5Ez
	 2ifNw0wAJd9f+2fEzdZ2sSOM+CBEgqCHWEHzouIs5Wh/D9s7ORBXEbuv3GKlua3bmuX70
	 /TaW9Kfbjxae43cRbmgGZ0OV6ClDPK5+UuXpqDM2fj+/4Fdi6J1mW5lGbBdcG4d5dJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NijiX8d;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F86606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F86606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NijiX8d
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1798570f8f.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794695269; x=1795300069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
        b=0NijiX8d1vE+GPA1QhDh9A/J5vIJnBdCXUdZpEarKfTpCsTOLwBY1zR+pW4vE1ywlL
         TTNF4KP86tA+LJfMV6RhsHQ2AaNlHym3c3wcZep2m/vouUOeVwZ54mJQ1Olwdu2V3l1e
         Qxg5QJY9gQ/GPL0OeHBvDD0yWcw9ODJygtXk8GXX3Z4cihkw/hmL9W7UnA7/qvX38CAj
         pHkPwdMDT/hqLniEOALp7HKWe6CZEoc0horXJvQk0SjeYVlOgk71KqgvsMCHWUH7k29x
         oHVy/uFhfkfPKJx8eWa6fouvmXYb/BBRlZZhaOHTkZ8++Bd2TzQrI+1uyO0RieLcqPY7
         IgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794695269; x=1795300069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8bnd7SDpe8UrkEnsKXdhWTdf3Rk+9zb9OfZ0A4bXQY=;
        b=AZPF2ubPy5n6FMPuupdd4q7CUMJNN6HkweG/rNMIRPswnLD2QLBDTyh132iha8kGBs
         JtX/sWrl2S4a/4rN+p6xFEoiEyBWBHobyVusH//oZZ7mqLEArRN/k/LjXvd4nRNL4JKy
         5zIEgHiZOdTvOUmijxL/eFH5XATDWnaBAyVb2dXDgR3mXo8SK8oqTRsOhh9xWyYumY+v
         gZDovKaO11ejXH+PYgFNFPAEhygRUfl5osvsc9DMzZhvitbc5pgv9ZrM8VDgU2+alWNn
         GlJ5lmx6cKOK9pRDklMFQgvaGax033ylr8eCA0Ma5K4Hh60aX3grhkNJ2RRizLlbmiyq
         R4YA==
X-Gm-Message-State: APuU4Z+AcQ1/dSroHEuKnwJi8s6hv9+89kerHKHgGBKQQggLqWS3lYvx
	kBYHFHfCR/l4P7QxUavjGGXjhXI6BSwKBYBxOM/O885TnoWyhRl3cy34DKGxW3Jq
X-Gm-Gg: AYBFou1EYS9CxKUM02TGV+c+MTJ2/UFzSjmxTC7sg335K7gOL8hd2hz1FZkgLJ8ESUS
	CwNvyKoYGWCPQ3ttqW8hGgh5IzRP01ysOVPOMg+7pq8XqlSt6/v5WX+iSBWSG63IKaXNHyu1asJ
	pjNqyP/n1Hj6jQGWo33cdWFNZfe3gPZPXhErw/P0q/c5ZxUBAUNJCXbVk/fMlnYz8WeiIu8fl/R
	7z+ml78PyfMabIhvxvvahs2LG0Ejwjs55k1XZLifhVbeNeqwr1syL6TsYIhbeMVl8AuwYqjrS1T
	R2w0eqxqarUAXErW6TYVcUq0GNu9V+T6LPpansMi9ubrS8dsOTttyqOrNmk3sYMhmh6k+Qa4z25
	Pu0O8z4VBDbzpxcNvCMJ39FhlO3XKyQCcfiOcy8y4LQoLFQ70hTL5yaHwTfkCHNkBsKWz4jTfmq
	K1Q3VM71eAGKROyAF0DTOXcB5y2NkRDQPcDXWcR2W7APwuXhGkn4zeKoPyF8Qh2D5zYXwoRndy/
	lkpqpYq7yfCJer4miPccdD0RuKehh10BvJfVGeugjAoyjaetuySEjQYzDm+yKF106dk1CbCW0fJ
	Y2uqXlHjK7D6C+4d6c/0Rk3EiTXUWKE1QvsIUf4xaarkILvI5da/0q4x9cb1aEeIAarro0QdEE9
	jA86Tk0POYytyS9a1Rly6n5lCp94/0UbhMukokNrIH8kRFIoxgx69wQlY
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr16824578f8f.49.1794695269403;
        Sat, 14 Nov 2026 14:27:49 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm12835727f8f.58.2026.11.14.14.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:27:47 -0800 (PST)
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	wellslutw@gmail.com,
	linux-kernel@vger.kernel.org,
	Janis Edvarts Lacis <janislacis06@gmail.com>
Subject: [PATCH net] net: ethernet: sunplus: check budget before calling napi_complete_done()
Date: Sun, 15 Nov 2026 00:27:44 +0200
Message-ID: <20261114222744.535158-1-janislacis06@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Sunplus drivers currently do napi_complete() after each rx/tx poll is
done without checking whether budget was exhausted or not. Interrupts
are also unmasked before the call to napi_complete().

Replace napi_complete() with napi_complete_done() and add a check for
budget_left. Call napi_complete_done() only when the budget has been
not exhausted fully, e.g. budget_left > 0 and unmask interrupts only when
napi_complete_done() returns true.

I do not have the hardware necessary, this patch is not tested on real
hardware.

Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>
---
 drivers/net/ethernet/sunplus/spl2sw_int.c | 26 ++++++++++++-----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
index a37c9a4c281f..1aada11429d4 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_int.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
@@ -125,13 +125,14 @@ int spl2sw_rx_poll(struct napi_struct *napi, int budget)
 			h_desc = comm->rx_desc[queue] + rx_pos;
 	}
 
-	spin_lock_irqsave(&comm->int_mask_lock, flags);
-	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	mask &= ~MAC_INT_RX;
-	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
+		spin_lock_irqsave(&comm->int_mask_lock, flags);
+		mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		mask &= ~MAC_INT_RX;
+		writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	}
 
-	napi_complete(napi);
 	return budget - budget_left;
 }
 
@@ -198,13 +199,14 @@ int spl2sw_tx_poll(struct napi_struct *napi, int budget)
 
 	spin_unlock(&comm->tx_lock);
 
-	spin_lock_irqsave(&comm->int_mask_lock, flags);
-	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	mask &= ~MAC_INT_TX;
-	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
+		spin_lock_irqsave(&comm->int_mask_lock, flags);
+		mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		mask &= ~MAC_INT_TX;
+		writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
+		spin_unlock_irqrestore(&comm->int_mask_lock, flags);
+	}
 
-	napi_complete(napi);
 	return budget - budget_left;
 }
 
-- 
2.43.0

