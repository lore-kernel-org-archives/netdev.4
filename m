Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711335;
	b=z1+MR1Do+EWfD3yviqFZciXVkOfqbGkjtH82lUpm1fR1M23ICpUpzuvdMpGagbSnUhW0
	 7Z7ituTztO+wPG6QA+TRCFprfZ/AXqfjBP+gkG493IhcjpS6mwp+mN6k+4G+A8thjnMHg
	 crvHvjUe0w+skgjBbTdgTasKZN2cb5az+bqlUbcvlyimOaUfZLv/0tXuXORHeMQzYXxsK
	 lFCmm2798525ALqr4pW2e1lhX5caT9eDhWrVRToj7OBrQiphZ1j6sbydK0zKN/LafAGKn
	 tDQHIe3PoEOA5R7WN3J40SCpvcKAz83q+OSVcP+6F7b16UGTv7ezDkwMMXltaCA4AmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
	b=o0qfbKq6lc0plfScAnL7f3cP+ysr1HE/AebbqO4gzHqwIYnKum8k5YstMq1r2swtxg/T
	 VMwwBTPLvC736WHLQJsgCS8FXgA5IXiUPVxs/DcsRgQb3zAXoqSNGJ20mXriI9KkdHYRE
	 46KRyZqGHybeFyctGwsdyondBMJQNztR7VflTi4NJsfbgZF/elKTY3yXkson3W7+/ZT/j
	 dD5lb8N0zmrDaAhzWY+oVzo8qGCcdlBC4rb3Pje8bP6NzLKwMNtM+YuQHGXqiN9eRA8/1
	 lVlX5g75SOwjtnjzL+XPOzsf/emSoj/tDyiQJ/fZuWgxusC2EMqJHI3v+ejx+zPjgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cv8Tq0Jb;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5BA606A6A8
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5BA606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cv8Tq0Jb
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386cf1041cdso3689535eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711334; x=1796316134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
        b=Cv8Tq0Jb+YV+BFZ/5fihID/rYp948VPT5RsHTv9i2K3gMEsB7eQFEEUL/T9hCyetKY
         OSWrBs7yrUO7IPYMpuGHcba7lLIno9ixLnDNNknBx+HnatkO1e/3D71sGhKZM0SlXFKe
         QEZpmwQw0MFXReKEJdtAHH7aEQndRQUG2snY9zCnWyYkKflKdyWSdFM1Z6DFxR+gAIWS
         IfCLPOY0s1D9FdmZIAdsQxAlRITU8rTB1RRpbdIecE4U89Ja3s3/vtiwIs3psz6YI9uD
         uqnsJffsfLo7ythuV2jAjuBflbY1WYVLWU5yRMtih0fgJsoP3RMCs5NXzL1AAX0wwMwt
         ubyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711334; x=1796316134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH6NUK5W/adpCYEnEKBzbCqV7trtdM3o9fkzVbPB1Cc=;
        b=vVdJrwVYOCVRbBUXJNa8hw8b2zE4i481GT084LqzZIdy+1OWeXLdlLJx9VuS72c2En
         l8rZOoh1Oi9p2KSvqQVLT1d5ufkA4nYtwU/ZfhujO33ctqD9CzJeaqxIzWfGmMDwN7fg
         25VTgvstxO++wOj4d5NIVmWctaKBFueFiJer8EzcIKRHlbaizURpmz0mW2rzWbW3al+8
         PTn3r4alQMAM7i0O2QfqOwyQD9eVrG3Uc+qigItsO2ub2BxmtQN+LN0ck2X/gryrUMS2
         PVnLg/ay+B9QF5Sya+lSxDdu6Ua6pYRiNhGyQ5ziqDDbs7tLY4EIG3M3dr26nA0VUOC7
         MiYA==
X-Gm-Message-State: APuU4Z9VVekXaBklOAsY1CgwqQqlaS58vkCa4hOSq5G2W05pfM2rw+8X
	hpoE3RVZzsqI06FXnGxWwkBpYBTkZ95PliRYQOqxP60AHSRCXNUrqoqcDKjDs+em
X-Gm-Gg: AZFdTZdIcGPFtUvOCQvLy4Q0Ub6uD4u3jcPJQCXexub8oBtnCbCPkDg/AV2uLmGDbiK
	h/v2KzdBD/Rih9N0eu+zkMl9vPNkKYRiTe8mnEeocXYXZk7CXI/od7lGYGyyGY7UErJ0ht/qgD7
	ocNECrA5+wEOJlxxORliIJTv4KHJmqrlwlP5l3OszLTtRV+kIcf+nK7prQBM2D0OBni614Pof0d
	YzeaAecyP4p6o1L5buQZ3O607KES6d+3ZeTIrk345RhHmchBboQps805ylpnUvRdUDhGnMsA85H
	qtU0Ux4sWA5xia49MHUDGaq446oqs+bY2ZNOZwtSnYje73w81QcWhFbSCJ9+oinzsHVKsLEV+4n
	ftT/vfxMxefVLIxgoGpD8wDhw8i7E3uVFuFSzKms8ek7CMOGwIkueCDCYiE2kCjT+GhzHrJ091u
	sfYZW4z8OcUAv6A0K3uFft/P9SsHgKYx67rSBhwcRgs9YH8Qc6nuJruXyS1kgzEMSWkHksieb59
	yqa7v1RYTPK4/z5M0HGyrgpE/2w6J0KcJw0Os81TkH2m4XxK8WnbjtcMq4ZPYKkvA2wnQG3Ffq6
	SBIF1ppvatfckVwIipn8h7UzEAAASF88LdaMyC/adgwFd6bYNzi4v92dwTf2Llgor/AMUE937H9
	58+X1vFhJBWaZa7G2QrMZGIMmQqquFugW9FFXh1uSgKIabOXWENTtVYLNvDuIqsH/8OV+vF3WRQ
	==
X-Received: by 2002:a05:693c:8947:20b0:386:9ef2:8e01 with SMTP id 5a478bee46e88-3869ef28fe2mr14893864eec.0.1795711334007;
        Thu, 26 Nov 2026 08:42:14 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 2/8] net: dsa: sja1105: keep pin function on PEROUT disable
Date: Thu, 26 Nov 2026 08:42:03 -0800
Message-ID: <20261126-timecard-driver-v6-2-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

Disabling periodic output currently selects PTP_PF_PEROUT even when the shared PTP_CLK pin is configured for external timestamping. Only select the PEROUT function when enabling the output; disable should stop the generator without reprogramming the pin.

A coding assistant helped identify this related pin-direction side effect, develop the correction and regression test, and prepare this changelog. The source-derived test checks the actual callback behavior with configuration writes stubbed.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index da35805152e0..7c07f76caccf 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -733,9 +733,11 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 
 	mutex_lock(&ptp_data->lock);
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
-	if (rc)
-		goto out;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
+		if (rc)
+			goto out;
+	}
 
 	if (on) {
 		struct timespec64 pin_duration_ts = {
-- 
2.54.0 (Apple Git-157)

