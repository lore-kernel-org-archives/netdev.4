Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063569;
	b=lKXx9cg3ULuM+pSSy+XJnJruNdu2Xoud5D2/C4Ni/YEBLOLjkuENEcalW7yNvZIHA7OY
	 DwJ+fOBStqZ1YEumuGR8m5w8KopNYVgIApniwIBsC+eV8WGeuQXvoLjELXfK0XhSuDy0N
	 w71iVbptZ+3d+VTGU6AJtftTRqWVKjGVI0249eKPunEstQZanCFlyRZorE4Hxsz4aWV7U
	 RRrh6ghvEZmeUc+nvM3Nn5WCB2fLpFLYVrzDUtgqPzkc6qfgZG6Z9sNxFLzYBoOBGFy6K
	 8oi4TmYBibZACatg39e5C1OhZewVRpFtmXToJ+heR6uQcvf82BeGfOOG9tB1OHBPOZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FeTY81b+WfrxgJ+JVJFyjcmUpktG/vXvoE1Ci/hCaeg=;
	b=dhk1jtkMNY9V306k2D47/HnmCHLgMYM6/IdanpTVhipKYRFClagp18/wQpnZG3gwpwUQ
	 ZyYg5IxGs0jIUL74u8fTrZ2E4l+At8G3jCZ2RlBzKUOE3Mm8F7mkfUIjybOFLXLvmXdOG
	 iJFuqo/VF7NsQGbBA9bWehunflIKuO3XnYc4IDwS8iFgngT+LX38ydCFitOTCF2MrJwan
	 KCbtb4L5mpMkkSieZ47rZpC5foRRvjkzM3AJ5L0CuaJEGuHK+ylZ+Q6QxirVVl+ZYAx23
	 DkZh1WxAUi7O4355iDkhkzRRwwdbRu3fjF9fTUfMF3AMdwZPrgPcbNldYvHPnUIHJmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpgMhnIW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7913606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7913606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpgMhnIW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40319bdso2695598eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795063568; x=1795668368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeTY81b+WfrxgJ+JVJFyjcmUpktG/vXvoE1Ci/hCaeg=;
        b=qpgMhnIWJHydnd+O4QGYgjWD8KpnXlS9kyTbFEvUPLV+SRAABUtpFF+JIunciTk9NQ
         3O1LpVLWhBau4w5ZRIIBSaG7SGql1glU1iPAHjktXArUNo2vqTk0jl3ID5jBxQCjK2Dg
         WAyLsPsJlVsEQnYZBJE6aEMyBFJ+useL2HSTr8TMM9ZqypIQu/HJmO013D6HqY5bUnB1
         sJALdDIiIFZXBj454usEku7KxN8T/SQ37LTe2oM52MUeMIQkR7gYpDbrGQetVEZrhnFz
         0XSkTFi/xjm+uof2av6RLgc2FQQ8YTqhaTUQdb34hwO1EqXM6VHcmscVl4b7otlPtou8
         n1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795063568; x=1795668368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeTY81b+WfrxgJ+JVJFyjcmUpktG/vXvoE1Ci/hCaeg=;
        b=svet4paykYfdEsIzWi8c9NuU7VpNmNO/pS04cNOIyWaq35AaEnagmiyOT/AlA5qZFe
         dNSbZf3VEOwpEU7mzX/CaYHmOKGqYQw76m2tQcFPIF/ib6sVyXiyDAmxFmcVYkB5tKlQ
         fxL6YSNjONfwUvyaunTLVMQyXCw9CJ2KITkzhc9zAYuOPkI8V/6GTSny/jic8oRw73Rb
         upJZxJv+JMd7y/C4efNS5wk9nDuzNAESDqcuEbVoT0YimbuFYgUH/zbKlEpwHUwAibJ9
         ewotMJxfdtMqdBp4Zv59YzenH0ZdO1f027YtvfYqxUqQfW/KdDpp8IbEtbZyoV7vmOAr
         345Q==
X-Forwarded-Encrypted: i=1; AL+hErGaLC4qF0w7FGgsRg5VSb4bjYD7s71KARDcJkNlY37bl1Spv79EmyO/9zrzKNqSG6/3KLg5rT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xy6C03GHOKFbQs2dmC+vEhAcSEjS2MLoSvFljSMAKXsZkFrJi
	hNERC4kWbqRMJJpPjofOi4xPk3IDjZV01EOFiyuu1RnoaNS3TLRrHj6w
X-Gm-Gg: AYBFou1D/lyKvs+n4dlq7Fjzpzhu6bbzSCEOpRAOHnmUSBU2kCjwOyjoAb7gtRjGaqv
	iTUVxPgA7tbq6lC9naKQHwbPLQYgRdKeyb+BCXhj3iIxUQx/htMmVbPEo7V1ay9AlLrHCPl02HG
	vkimbcMt74xvnluticAdSE34oTEBSYjKDEeEkLKEjNf80C5trvTGcS696IbpW5gEHEUmebnLtDK
	AehrXbqFEbtwoItMNhl7bwhQ8LFPuTkj+g/yUwb6l2gKwVkQSGlNoaA+vVZrnntv7I45aiOmWmb
	+zfPR5oElKmfrm94JcjFaDZx1OlmuLRwjEWBZhFWatsvGsVPhU/5E7R2inYgPQRj+b30qkLdSfd
	vhWPBPL11+SrgRgYKn9B0orK1CvBhAumDY89rD8Rq2ExedBLbyygtePXCKh73/A33/0kArRhwKq
	gjlrkhisq6zlDimB0DDPLlFCmZvz2GZ3nNL27vgB20InrWVOG2Nn1smJOevLI/UdYui0T+L3iBo
	yjiMOQajD1A7cuDFnqxcDAza1AE/NPHASqdNdXkGWkkzXtHQCPhfRWDBmekMZCvM32E/GyePhyJ
	WrgsHMs6YISJEu5GLQARRdr+FDhU0KeF7NG0sNUb2shtzwrEeLnJjWbSOI0M
X-Received: by 2002:a05:7301:1610:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3827d52c432mr4178801eec.1.1795063567342;
        Wed, 18 Nov 2026 20:46:07 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:9ca3:fcf4:a4d3:2073])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm12546986eec.21.2026.11.18.20.45.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:46:06 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
	Jordan Rhee <jordanrhee@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Tim Hostetler <thostet@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matt Olson <maolson@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH net v2] gve: mark the flow rule cache out of sync when a rule update fails
Date: Thu, 19 Nov 2026 12:45:37 +0800
Message-ID: <20261119044537.57936-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
only when the device accepts the command, although a failed add,
delete or reset can leave the device state unknown.

gve_reset() sends the flow rule reset command from
gve_teardown_control_plane_resources() and then frees and reallocates
the cache buffers. If that command fails, the cache keeps its nonzero
rule count and stays marked in sync, but its entries are now zeroed.
gve_get_flow_rule_entry() then finds location 0 inside the cached range,
since every zeroed entry has location 0, and reports an all-zero
TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
location. Queries for other locations fall outside the cached range and
read the rules from the device again.

Mark the cache out of sync whenever a flow rule command is attempted,
so that the next query reads the rules from the device.

Found by an AI code review agent; not triggered. Compile-tested with W=1.

Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
v2:
  - mark the cache out of sync on every flow rule command instead of
    clearing it when its buffers are freed (Harshitha Ramamurthy)
  - describe the problem in more detail; drop Cc: stable
v1: https://lore.kernel.org/netdev/20261118023429.29330-1-enderaoelyther@gmail.com/

No new W=1, sparse or smatch warnings.

 drivers/net/ethernet/google/gve/gve_adminq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index 2c848f0c23dc..d0e0d9ace3bc 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -1401,8 +1401,7 @@ gve_adminq_configure_flow_rule(struct gve_priv *priv,
 			sizeof(struct gve_adminq_configure_flow_rule),
 			flow_rule_cmd);
 
-	if (!err)
-		priv->flow_rules_cache.rules_cache_synced = false;
+	priv->flow_rules_cache.rules_cache_synced = false;
 
 	return err;
 }

base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
-- 
2.56.1

