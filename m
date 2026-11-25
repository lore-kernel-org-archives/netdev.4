Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574215;
	b=2wdvrxnAe+qOmX2d3ydy8lXV63jBeKRrhObU45QTy2uCjkHU24wf5DbR0hneUr9vYLuZ
	 7qeBBqXojVHg4ulsUtN90svOrmcnijXFy03Xs/DKoA0sCyZTFIFonFbSrQpwtSqHyNWo/
	 3ysNZUS3HGCS4jzmDY2m0yg9wq0zKbCvDdVk4/XEjlz76HnKUSuxihFl+Tkoab/ENHbyu
	 wclxItYQ4Ur8vUa3OUhE54qCIrodLMiHisGrOvJOxxIt4UifpNCaWo4HGSgryPuqPDCSZ
	 sRPLGk3X1hjfb2seacUWaoyQuLXoDQG98fLdv4xiqyugxUmKTENRWlX5UPFsqSCVJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
	b=my6NEOIDQj+IsOMcmXihp6XFrTfN9wNa3JR2x6qkSQbyYa6lN8t3tVUP1t66vVGberF6
	 eJyd/8cCK2sZWP+C0jr1mHtRGfygtIZQhY6UpAJS0WLBqE6H6yIqXaEElrtoq8BGQLuov
	 GcO1RDwdTghFhcLu568QbE2A2sW+EaafOd0kv4HCsYyrAkaOG45u8hHOb/4tjDDFUU3ex
	 0iQyGEs3LqIXHE7XW3/4PzInzbsyevfhdmQpo9TUqFxNFVo9mRnp+DV/qsk4G+6Kr3zY/
	 QdHjVQ8bY3jwJ5h5QQAVqkJGTki7y6P47Io23sCH6uI+1ZMGzx2e60UADSU3wOZjzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKQHalZd;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D766606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D766606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKQHalZd
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b2f59de176so4097590b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574214; x=1796179014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
        b=xKQHalZdJ6ZNynwBxhbPZ6v28J2vCpSQO3QiW4t+lfKxVlX9KVl2WbGmreLmh2JH5L
         yOLZWCcs6cwkBoL3BTi38iPcu2Gvvyf7Y8rEDkuRi/bBR69kN5pyqlVt1GlUpwWpmcjJ
         q5BKzgU+5n9SIzymPO74CwL+u7H3z8e3IwsYl5qUtpgevklwVvZlfxOzF3Yypat/GqZu
         5O8p/L65VcIdpL2h7Wy0Qqxtx+ki7HPPAA9gr6/mhNE+IT959YaUvgjfKZLokTgLaR2A
         NLMCL/ecSevMhzGK83W0bCxjlrgkr4dcnKdML0M16vdJ3WLCXn15qHsTAUxDVR8zwcDM
         pz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574214; x=1796179014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWY5PUY4KfOiqJ2qOGPYj99Y/AHpB1RWqszHGNr+0xo=;
        b=bfuZEgS2kcPuShn2Q7oZ7WsaxqgN9+ZjYN15VcBvJtbCMo+JXfdUFsTjqLpACvZEsW
         D/m7WIV7PiKrMZybdECTRpL702kCHOZ356BimZH8E2MHzn8IapzcK0LiT8Ed5qD3/gsg
         XFZXpRErun0YJzXo9pqJ1lKIC5hp3pOKfpWBOnPuq2yfAJduYE8KwlCor53N2zmjHE1c
         nHDOw+jgX2jG0t1ED0EO97tmuMnZpKOplVlAk+70dg5KAqtKKeUuB1EC0h/x9twY7TpO
         +TKsUiJuKpVJT5Vh7KwcPazPIELnPTFhD6ChWb+pp5yMSWdatMDcK5veN7D77tm+59xQ
         TclQ==
X-Forwarded-Encrypted: i=1; AL+hErEMD6W2H2ZhisZgmkPrC+gNVexm6Ua/R9+J8PQUBeoEcnma5EWhirqYetNLHVQNwmRxSRUpKvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GY5aY/PbsuJ9AdU5q2JISuld+72ce+yPIOBtjC3nBR6KFzyIA
	t7ybEqpd2gAdRSupnM+aroF0bvzBz1ZJLegHEff5SeT4VFgdcMXVnEOS
X-Gm-Gg: AZFdTZdP7uetytX4979B2B1854DRylfoumZAVoJxtQmP1DxPp8OzmLL/abnXVztoSJM
	yPKdMRKMLUp5fOpA6aqBUZdonfMV5hs9hgnR+Popay3HhkfFeGEktV0vJuDW6WA5Zg9jfB8nZWW
	RSZHK2Y2u8s3ro6nSQh+SB4KmVqKMWcjH09+LWrhpdPOw7r6eFY7iwjx63DxHD7E+TrDHDYsrfa
	LcVb0YEqGjXh2g9TLowHiHNSOg090ivUqYAS1hehnMdYI2Il5zj1J4aLcHke7kY6Jut1jE/pHXg
	y0aBsIXiFb2CMBUTJQFJ/gJ0CWxLDAtAQY5bnoUzXIYZ7JaSCMj/IMjMjmVKp35d+NxEuD56s2F
	OKiOpVJ9cogjpg+hIUw8NKxkl4GZ1gmskf4Fnl5+TLWAnIaxbAaI1pD8GUXNcp3MJKfkmLd9tjf
	4SuuNv577CnpKxc+ukfp3gIlex2Xs+dnAxeKTFxmnPdNpyHZrJj7NPMQHcAcqdYy49XA3pfj0PR
	vq2j6TmPzmVU9FuNxZ0lvgZ13Q0jSxTeXXhUN3qrXXQ5dy5AMoGQTWaS4w+la3J/2INlR33Dx1L
	vEXYF1SliiUB5hk7ihaDlfT0qaUoB8HHnNMbe/ISyV5Tj9b/fXv2s9o8zvJR/+MgR38=
X-Received: by 2002:a05:6a20:a126:b0:3e2:7a05:6bda with SMTP id adf61e73a8af0-4014d963fe0mr18125416637.43.1795574214549;
        Tue, 24 Nov 2026 18:36:54 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm7294885b3a.23.2026.11.24.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:36:54 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jun Yang <junvyyang@tencent.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 0/1] sctp: fail the association when the INIT-ACK cannot be processed
Date: Wed, 25 Nov 2026 11:36:49 +0900
Message-ID: <cover.1795572890.git.kyuwoncho18@gmail.com>
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

From: ChoKyuWon <kyuwoncho18@gmail.com>

When processing an INIT-ACK fails, the association stays AUTH capable
with a NULL association key, and close() with SO_LINGER {1, 0} then
takes a reference on that NULL key. As Xin suggested, the patch
processes the INIT-ACK and sets up the key directly in
sctp_sf_do_5_1C_ack() and aborts the association if either step fails.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v4:
- Free err_chunk and abort with sctp_stop_t1_and_abort() on both
  failure paths, which also sets sk_err and counts the abort (Xin, and
  the Sashiko review).
- Say in the commit message that an INIT-ACK from a peer that is ASCONF
  capable but not AUTH capable now aborts the association at once too.
v3: https://lore.kernel.org/netdev/179539544818.3016044.13738712075053349592@gmail.com/
- Pass the error to SCTP_CMD_INIT_FAILED with SCTP_PERR(), like the
  other callers; SCTP_U16() made sparse warn about the __be16 value
  (netdev CI).
v2: https://lore.kernel.org/netdev/179514851805.604157.8527055700821138420@gmail.com/
- Process the INIT-ACK in sctp_sf_do_5_1C_ack() as Xin suggested,
  instead of skipping AUTH in sctp_auth_send_cid(), and remove
  SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.
v1: https://lore.kernel.org/netdev/179505710266.3511678.14017674052424733262@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, the reproducer from v1 no longer triggers the report.

Kyuwon Cho (1):
  sctp: fail the association when the INIT-ACK cannot be processed

 net/sctp/sm_statefuns.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0

