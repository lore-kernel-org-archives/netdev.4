Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115052;
	b=QWvPQBa7a4tJMWp2lhH75texNOYH9ud7JG6C6wqfuJC+QxL/8TWu4rJ2VD160wR5pw82
	 3BQIcPKD85a92kaRghz9OCPx5/TJZsjExf4mxhXjCAIyKqGhgRU9fPfnhfXhgmAkgyWTW
	 QJhwIlfbJ3JyS+xwEg0Y3O7YVMiBd3DEnAn5lo9lyrWlVSDyR5hWyt7oHcDLSHeqym/0e
	 LTQPeLn+1KzAdnO/mgy/JnYalsdNiU6ZyovU1qO0GLXxIClylfgV0Jqjs8jZcO4lF1gZi
	 76NLVAheGuXLxE3ouhD5iVxfIlmkceJHCm6TxfKGlRaVahvyse8/wpyyuT2Ow+2DTjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115052;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
	b=2S0dmHertcTUcDcNMFFfxnbXTxp+JWcJhScOv+8REzA3+Y2YwIXkEaLq9jD5G1ez8TO9
	 aayeFQdPRueDebxQxehVntplC+SCnURlwVd3ENcErWSZxmLPEdR0t8XqSZSLVyydP2pJb
	 WaZ9ZONiBuexRTSvd58CuGp6hZv+QjNvzyg/+cYwF81end64NfhLe7vlt1ChRO4l62/yX
	 9X5a2ghNCRyQvAyOSmDRP82C0bVeBVy5BG5s5ZJ1ZFlJvMDzQeLlZg00J6xQhaxHPgU+D
	 5kZP36s7TL0E2KkPNLwJFDl+/vUaiHnw3IaPjxC4eQPy9K8GG2dbJADkR6WdR2H5GMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OgguoImt;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9C7606A33E
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9C7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OgguoImt
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-55d3563e50eso1699251cf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115051; x=1795719851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=079ecKFhrx6/T5fQPDxEFjwsHEaKzOQOEethchpob36r57Y372iblljIjdrsgP3pgx
         9Yv8SVvE7AXXVZSp90calGJGMmi8V2HrmyUUgG9mVn3HLPO/Rn9QkY/yK6TWNrcq/f5s
         uguK+ALnJjQppMX+qgJuZKARIIWm4mIxfAYzFf8IHfGmwt9gQLNMe5/2CoJ1LmZ2RVX1
         FWbHpGqeOZHCBKu6OQVbKd32u4wNmHXcLR2BYgRg41w6maE9cwQw+NulNDsHwsC/1/By
         vF+uwikopzOuaJIi9btCOnwlorHv3cCJjS88Zq655YU7OeaatesGhJApS0joru/uwaco
         0hAg==
X-Gm-Message-State: APuU4Z9k72Z/8P7/QzdeMMAqtr3LRKkD8l32/U8GJRPpkB+maWyezsTg
	m0sBTBcyWNknSAB/m03vOWxSldXpc3RX6kS+uepmkC1L5iy2pKY/3zADz1pD/feXiFz2Bb9L4H7
	RYczUXsjY76G8rZ+syNMDkZuxff3AeiSqujLxBycv7e3UFKRHTaxJG6JwqPLTEuN1AhlWomI6Aj
	kdJ59jRT5awwCpSYI6NxynypPJLfKYNrNHQzMWRtLMMDzt33usOAsTOdg8LoP/tmaooyOvnSnUh
	iMnm0sZFMGXfZJp
X-Gm-Gg: AYBFou3J5+ozggpu8BcrtKMF5rmBGxiafN4fJdo4n8H0GX2BsAD2AqKowmPGrsV3A2F
	0cti7tIHJfpCkBOhPHmp+bEVXuOusf/25jApt50UUzTM9b4x2L48jAAbIlQhVXC9cr+O3tVqbkA
	qhvpOlKX9WBAhcBr/KIMg3Li8CMbiXglqIqGkZ9ZIyBtUQUFZZTwRm/SkP4t8NERjJj2Kt974Vo
	BprA5lQGBPXfW9iOS2CigVnSN7wu5jdO1oHV974jcNbrDxqfQI+TiKYwSKty3co/7QQP7BbWEzu
	HY8j1jzMOuXOuAcS0Z/umqPuQR7UbBFZvDOoYwOHkn2sRMCGXDL3u8ZYFbp6HkkqARnxElctP1a
	cPfGNQRnGiAN8hvxR27EOxPiT/iSL+hiWkRtd9Yg3BXRpKQXWvmjFVyMy1drKVLrjmuGOFc90FR
	voHhbOAMC3J3QIcABiwYcS1VkZufOIWhnrm9FrGNS9L5w=
X-Received: by 2002:a05:622a:1b1e:b0:534:3634:6960 with SMTP id d75a77b69052e-55d76a5c57cmr17743231cf.43.1795115050683;
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d7885495asm14271cf.40.2026.11.19.11.04.10
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so24127185a.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115050; x=1795719850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yh/+MQvK1b1bcv68JYPLNZYWga4ugttJPubbV8w+EUI=;
        b=OgguoImt96GqAc00P8DkMK+9kYQkF97l1sp8A1Xgt1A7JcSmxhMHe47k98O6Ucq1bv
         ppbdaw+dgt+p6hnecuLY3XVmKcWrWoi9/jJQYKbe1Um3ZKlWPx5+Jdzt6Jkgaqy0KvKc
         vcwFydWzwUcdOoVgvxGsIitfsdbh4mw+AfGdU=
X-Received: by 2002:a05:620a:63ca:b0:93f:3bb5:5452 with SMTP id af79cd13be357-949ba99c7d9mr76859985a.15.1795115049686;
        Thu, 19 Nov 2026 11:04:09 -0800 (PST)
X-Received: by 2002:a05:620a:63ca:b0:93f:3bb5:5452 with SMTP id af79cd13be357-949ba99c7d9mr76851985a.15.1795115048931;
        Thu, 19 Nov 2026 11:04:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:08 -0800 (PST)
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
Subject: [PATCH net v7 3/6] net: dsa: b53: clear stale state when creating an ARL entry
Date: Thu, 19 Nov 2026 11:03:45 -0800
Message-ID: <20261119190348.2317702-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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

