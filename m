Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863395;
	b=LB56QAfeh9Tv7I4KP05SC2UTrQdMoKylwkzINAehTZ6AqU8urunpW3i1SvKW3ML/HKB3
	 /ED/Z7WBv1WIBjSgzFTIshR65Gr5ljmtADIXNqOEbtcaD0gd2Kc08O9IE/bgC9pImXu0G
	 6i+mMJEK98J93n+z3MyUTpRcqNegq/I94upBVwsJiGbZKD5RHU58hTN64CCvmoioBq6c4
	 bOdVe4aTmuU5fhpIoAXJl5q/RZVKKv9L5uhqckub+x0x9WWlUY4QUxn7Y40pGaOb22VEt
	 kjGHhlie0OJuTD5mSwyyXjaPtzLYEn60dktrn08khwzF7KYGRkl6/kdp0RnhgfADuVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
	b=TK29+BDiQf1cvNTD86farky1AHRbliNObGxcSY3TSZvW+QkLsc8GKc+TmLC8h9jyz1nF
	 L1tpeDepoEn8OmxIi9xXep4iUkF4T9FYsvBOTXx7ZBnW+8GeTWml9BMcl+bPkwTO3G8y9
	 lKOzyw9yCR/O3YH6jvO6yDz4ZwnHGvRw21Vfto62VUIgHUV2OX5AKaMz2UJLhFJOu/IrK
	 8rDp2zQUTbnKOx8aYAgHolwKWvWFu7ylQNjpBWV0XBf9ZIQNgtVOgvMhA/IH4MeI8QncW
	 o6qh1KkET1lJQ93zKb2gVXpHHlWB6027RX+cHb/F1tUdPrXn3kNQKTN5+NIx7cp/mfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O5Cm0z4j;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E546606A8A0
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E546606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O5Cm0z4j
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2170420a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863395; x=1795468195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=zJG9T0Rojpyf2JN1zgpi4a9IHNSGwuK8IMW3oVHGxTa1EjW+7N5a50kHC/sAieuAaA
         X7SIAMFRrojl+MvvFPNbwIlp+xwydTinmNu2oMYt7AhSeymng74ZhLaqhmhPcNHv026x
         RxnniSEqZlR3fYyWu4zsSXG9k/kBgJqK7wAGpmD+JV1JQFu3i1DthkMtoN8UdHjuAKTX
         VgagZrG6RrE7JSFbbQPKWW/I940HtbjkhjB1XUWZvUGcKP67e+GEpe/AOTGVxodmIfYH
         o7ky7L74we6MmWaa/hTqdB6gt2oqYeU5yXhITYqR9EeELon2I8ONm7nr5RgiIiSVhump
         y31w==
X-Gm-Message-State: APuU4Z/bLPU+bWJ8I/+/qMp3t4POR6IwYeS7woNjjYQzHpO5FJluNtJZ
	aO/N0U1isWuWUpe0U6IYdsi+SB06oX5/Cq6JWl60cArtlF1t0BNPfV/+Kbc3yxgshYxoJ1JuUyZ
	JIZevsym1iwUhSjft4O6Vk0PG/JBqg7SPBVEwvv1pa5QQBYcbb0T3FsTIBC2vfBgnxMUQlXUcqs
	nQv1mEVkS5rKR556FAbmg+fjOXoiqMtVxK/6O46dThIUEdRa5oK0uqKzqEYtKWnxmE6sKxLaTdu
	VmoyCM+vCPRE8f/
X-Gm-Gg: AZFdTZeDj/6yf6gx/8FcFEkRCB+Xi7Yg37h4CWbODC52/3n6jolAH9S0HpYHpoSq3To
	nOnUiPZ6STfTxr6EAxcgS8o0vR/Crzd5YmiWP7gT+1yReYgppJPv8ivSsuc9IP627m5iiZKgzal
	AraGIv5oAXCVjXQjCuTEgIJyFFVZZC5NArNQkaeHg0kKsWXoPNSMcLaaJhjGxkJpPWMEXHU9IKX
	2If5kx3HkPexeDVLu5TJy3FwGqL8SqGmgPp4bS/r+HohTfdPmOK09oNmmHCS76a79TaYsc1vq7Q
	THd/GTUDyUp2570Ghsj9Gw7ingi8glk6cMpzDtRlBE35szePatItt+FYXDJs71JksX1V3cBLLeC
	DywAsKgPQyDhIZ4NqJJcCRLnM+BXZEAHtTAl21GX1zelGnqA2Ghruc8awkZmYC7IUjYqYg9NqBR
	ssYeYVRXx43/9bo3DVQA3rPN5caA5tqKbuxKRiEYsXCUs=
X-Received: by 2002:a17:90b:584b:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b1b0ccefabmr10857828a91.66.1794863394654;
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2654977sm4934194a91.1.2026.11.16.13.09.53
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ec6cd898eso83048416d6.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863393; x=1795468193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=O5Cm0z4j8Zg8Xho0rMMfx9izr/LQV6QrP1Qpdto++5n+JZYE0wzsUuRdfjWzRQ+13m
         yznyIV3zGkSXpbMXH5agK24zoCz6E9b241sOgmEY5j/SqgejPU+22/gTR1hS5KVgzbxY
         zRw/2fDN+Px6BFcjo8sy+AxFRZQceLMdo2xBo=
X-Received: by 2002:a05:6214:4602:b0:91f:16c9:1005 with SMTP id 6a1803df08f44-91f241c1b04mr174700586d6.25.1794863393038;
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
X-Received: by 2002:a05:6214:4602:b0:91f:16c9:1005 with SMTP id 6a1803df08f44-91f241c1b04mr174700276d6.25.1794863392522;
        Mon, 16 Nov 2026 13:09:52 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:52 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Mon, 16 Nov 2026 13:09:37 -0800
Message-ID: <20261116210943.1352656-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When an ARL lookup does not find the requested MAC and VID, b53_arl_read()
returns the first free bin index but leaves the entry populated with the
last bin examined. The multicast add path then ORs the requested port into
that unrelated entry's forwarding bitmap, potentially forwarding packets
to ports which are not members of the multicast group.

Clear the entry before creating a new one. Also return without writing
anything when deleting an entry which is not present, instead of writing
back stale bin contents. The return value for that case is unchanged (0).

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 1f5776dfaae2..dac6013f8fe2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 			addr, vid);
 		return is_valid ? ret : 0;
 	case -ENOENT:
+		if (!is_valid)
+			return 0;
+
 		/* We could not find a matching MAC, so reset to a new entry */
 		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
 			addr, vid, idx);
+		memset(&ent, 0, sizeof(ent));
 		break;
 	default:
 		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
-- 
2.53.0

