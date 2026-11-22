Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343053;
	b=VFnc48WjkSA1Z68PFlH97D/8zW6grmce9Skn31Ws8BcFag6a2IsgUBQknM3jseRvx6+o
	 eUGO1lzekQIiudyWvAZ1G5hV3l2r16VwssHNWVQxSYVvGizCvh+tz9LfwWzyYmfZc8aYL
	 OOqXBLoTRJi0BWrcU9rbTiTK3HDkqjoR+FPgc2WUrc3Z5o4/n9REvKd9G6gBtFv1mhs3v
	 v+eduvrpEb5u3ZfbCyf/BxsqvFsM9IcNKHz0ufN0TA9u5ecoOH8Na4ZqNfNvtIC8qTuDo
	 sVzliqryDuYUbzxAJfSECmuKgWlLkiIhgMjIzpI4RXN72DHqLYSL2HB3vm6kAU+E0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
	b=Plnvu6qH0Ez/DRijO23lYGcGd441APNrJG9HO41smDmT5xAW4Vy2gM81MKcJiHbTP0jn
	 /Uyj8fiKDliCFYhnf30vuBiinrzS9rIOplCo4tTnvYlyVRaYNrM8RjBJkQp6/in+4Kld8
	 qXRCC0giKWKz7USYbgFX7L1eKu5HhnC9FeoeQBiaPtmJ5nWEKHVE+VDeasBkvxDY2Y0LO
	 Gh7CWpplGIgn+PiNEvBWDuQzp/WaW8ACkhqjHQrHhC+LAwwLvR0l5XBMjQQp3o4/4HceV
	 CxemtFkNPPWb+hXIDSMSq1jlYAteTcVBIpVGHFdaC4ZeBnQo1Gf9x43tZXpB0RsgZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ7coL3g;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576A606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4576A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ7coL3g
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so1792644b3a.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343052; x=1795947852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
        b=ZJ7coL3gEISJl1PLlqY821FIpesNyJPZ9oZy8hSoA+OWxvgoggA01SeZsnpXWEw2ii
         BFYB6oXqgYny6UHivRXVrZKQItcGULyRPqk4+TYm0rfdbv3JnwNZoU6+bxBC3dItO5Z1
         asM/9muWf1EM+0ids3eOdYhVvAzVNIOgH2eXtFq5i5E6sOzJBRC26IKSuIrGPyqqaq+9
         EuDPQTYq//irCGiWokrunYABuDiWXGFyUrnufK5GUK+D6jxE5KoMcPS1rV7b/inpi5bj
         xgyuJX7CIwsOAIZtCtaWg5fagTJt4U5/3uXxmSCGMl1QO8WbMeI4e65ovcfeKR/5WzW1
         oAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343052; x=1795947852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
        b=k/jEapv9gTXIiVy4RwkclnJcemiXE50udhuSzkEYatP87MVkCjjzG4JFVDob0Omcvs
         iCQ3U4R/68gFsMl3Uv68doBsmZ2So2b4/G4tVH79NpRn5rjUjyb28FsZtQ8ouCvLA1UM
         Tdb30Oqtp2I6en0a9rF0G2JuYbYQSkV060ax/RBCyh5duj4vNgFNyiGPB9E6I7QAIywO
         tLwsNUnDl34xcVDMDe948xXLqVrJM03n2RbDioCyKwwDucm9m+db0OYHfgEEo6tplMQ/
         nCJnXghIzMykt40NTpmPY4B1x4jBVuz2fppfaLHrm1oyI4kTO08+XFt33H6/oO015/lX
         ARMg==
X-Forwarded-Encrypted: i=1; AL+hErGiYF/0hyT8nd55EIBLvx8Rvq5ZJgkFH0e20bKecW9sRabYxUwzbLqwLMnfqlOcCUqoSl3oNEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+om+AwCyzd0q4gFTRtZVQNgsvxnZGCG4x2rKIqc2wZhRgdkTbj
	IG/N0/kV68LQM4plIC3MBENMC5PkBxS6Hu/i/yLDcW3Imm9Z0MuhIzQX
X-Gm-Gg: AZFdTZfpo2rrMukYWMO1Bm7DP39WFthNcJ2edGfidR0LJqP45VJQaUGfnIdqsQli3M3
	mpP4bj507U/pUBlrFlPyiPsTA/+T0geti9KOiExo9OhVltY42aKOa1llGws8dqP4ZBakvHo1Pwn
	O6wqwKbUUU7k/stmKJzVCvZTBr5Pu6yNHvYxdHtMD8nVxktN6C8Hxs35Lxwl3vdrger39cqeti8
	yHmENUowmYTwHnM3dl375u7XVpsowEeoC9g7fn8uiOsWXG9kKZaanIDX+dMQkeU59UVV4jraT9d
	EL4429v4BSucUVFWjzJ6QcHwU4unRew7W1KLRYrBsy2cKzFxXkxnN05fqpiZFb5xu+n9sy2v/Wj
	htKdoGjXH+aQFnorxCe6JwAlHzVx2YwID3jccLRZbvnkzEH+ppGnOHyJzCevr+gHT2CbB88bOf8
	vb6RVPmqrBZEn07tn+6TN7pzSKrrXnhtTCDA6PD8+1dezvHguwYxGMKVG7BHHDZQcbxBdBoRADW
	valp2BhPBFZh+mTCmfssywPcLRVMMPIgypGyPrAQjqRJCwy7CkHjyClFUpHdeYmDLnKvxIDEsyM
	o3qKydCsbOGpRDNOusY+datgvIV2G6IRUZRjQ655QfLLwWOHm4ALKkoXCAwDR9wMIjQ=
X-Received: by 2002:a05:6a00:2389:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8c87c38b44bmr7939461b3a.32.1795343052585;
        Sun, 22 Nov 2026 02:24:12 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3968398b3a.36.2026.11.22.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:24:12 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/1] ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()
Date: Sun, 22 Nov 2026 19:24:06 +0900
Message-ID: <179534083350.2499182.16169984227830330896@gmail.com>
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

sendfile() of a UDPv6 datagram that needs fragmentation over an xfrm
tunnel hits a WARN_ON_ONCE() in __ip6_append_data() and fails with EIO.
The patch removes the MSG_SPLICE_PAGES branch that causes it, as
proposed in the report; Ido asked for it to be sent as a patch.

Report: https://lore.kernel.org/netdev/179497871649.630760.14878797494884573363@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype; the report has the reproducer. The
patch was written with LLM assistance; we reviewed and tested it. With
it, the reproducer runs clean and all its sendfile() calls succeed,
where they all fail with EIO before.

Kyuwon Cho (1):
  ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()

 net/ipv6/ip6_output.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.43.0

