Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758165;
	b=weBWXH7rF5keiI1d14cph/bPS/qwZK0J9cQTLrhosVgyTV/R4MqD3YIorpiqtXjbCxdu
	 2q8Qr689eWy+DkpgU8IpcYlWL6w608mX9Ldz/KYQ1IegiAOtoOYKa72O9B+AXPf6ZYECb
	 FGiAqvPbqdiU+EV4fb+EEsbBHk+/ETP8Lll0MwhlnbusAKsWqrVpJmpRAc2tiT5fQHNeP
	 ucyeAlxWAl+8699wHiGQauN8yjjBG9wd43YaQRffrPFBE+szBC6SoRsaC+7e9ppJ7xMc/
	 2t294iHLLSnwFxxV0RBgiCslBPCySNnDfD49skJp/1B9AAbLIJ8Mds4Ej6LJm38Lzcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=EZ47fAJoStJb7egPnGVCNEaG5YQDdtGiy3CD20rR3Qw=;
	b=20weQLxyZxxoDqfY1W+0TznagiRh+oX0osllHepnRx/R/rIMvcpcxQr9J65dKQsyRaWR
	 nmD1H5Cp3PibEDeU6biOHtLZNV+ExLXI2kFcWJZc7DlbV1Le3ZUoBjutLNJLpe/wUiesB
	 g/acTQsJHlZaQAG2wMivBd70GqjTb/hQBGZh+D8HrCOalQms8ikjFGBep1ye3Gde1vUjv
	 5g15qN17RAaDcewMmQyMVFTexabfJUCm9H3GHQ/eJDeTq+Zlhrc62jDOHPVzZqm9CvcTM
	 dAXjIWWlgUVz3Rt/DxEd3v0JatSB6L9XfKagPGh3DkVFwvWG1vS36CFKePb4vKhrcCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRxqy3NP;
	arc=none smtp.remote-ip=209.85.210.195
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDF606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRxqy3NP
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso4344659b3a.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758164; x=1796362964; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EZ47fAJoStJb7egPnGVCNEaG5YQDdtGiy3CD20rR3Qw=;
        b=MRxqy3NP3GL/G3suRQg1oSHyEN3kjtMVr62VvQSbvwZgt2ObBSB/HzlbX9yrAF1ljL
         4o18/Vzl/urqCQiM7/i/t119WUUCa4RHnsLbkFA2s4euX1SKXhT8DwYhcPC0oDbvWNFt
         IaPAQF+3Ig2aBxmVjKgJawY6VgxhhrwecolNpqQtwpekTKJiTW5oYIejEC7zfeXpb4uU
         qaoca4GPErLR+pEgAgWTaGMs9nHuvL9cOoeu/mhum1gNWzzi5Fyi7+8Ak1V/RkaQLeyd
         nCaX3T+pguYPfPLCeY0nHtNBn4EkR8UBzqngtV7p5hZ/996O3yBopgF5hRKYi55zZn8j
         efAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758164; x=1796362964;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZ47fAJoStJb7egPnGVCNEaG5YQDdtGiy3CD20rR3Qw=;
        b=WeOAWp6o7ue800MPkjXHgV7UhDfVQHOPrgdyPd5m88yECWnfzNeWE0KlNCSCHSd61T
         CGiGhq2emzGKMbyM2OP0P0A0prvwHfSjg8W5OrLyqMDuZ6ria7RoBpTEYGTGOq2geo1L
         TJGh/JeJdYf7qLyPNtNNY1xEjm5V0lL3sOEjEdtZNpV+OJSFE4cD4ca0jFMCKJqQdAiy
         j2kM1DJCxABdl1OU/2X6l0+R1x89ZffrQYu7Et0+7eDe6FeaiEq4Kb6JPU8xQqhE2R/P
         uIoQO5sCtrzveHo7hmA6DZCKIP/vZ0sw2laPbvZK3ZedIFltQdZt6zv6sJRdh/L7Zhqs
         RIYg==
X-Gm-Message-State: APuU4Z8F9tcVz5Q+4TrfQsoJZ53FUf/KzPbvbjC+7yklD457rOYcfIEW
	+iAwuMqYdxA/2WrMbymStSqQe4WUYn2Rzs6cCxgATPhEty40x3C4k9aI5hnUzBHiKor1jg==
X-Gm-Gg: AZFdTZdrySPsafKbpizkNRMKCRfrM/091UFsj/p3Pz7QDndnCh21Oo3hS9FIpnSr1UT
	M/q5E79AAwGwia69yh9lz6LK2hfV86+gtilXE8FwravkAfkBBAYh5CzYyqs3nGFE2HA40+STAJk
	C+DtruYrntbrBINHhQ7Jt87ujv7pMYEEAJxP+gOyYGGbrQ7JH8y77f/FOtm4yVzY700KOnpQ/mt
	ITZ8G+BQHRkanfazDisGw62FUwGECRC9gyN4twXCCPpYPvw8EXcfuss+Ekj8aIp1qe3lAvnAEhL
	3/lNmEOD8LRZGlgsVnsQRuD6GJIdrF7Z5OAD7HzS6gQKWMivq3PhMI0KiHoLk+uXStetsf6LY6F
	Y7/8U0dS9sovgUt5rSHDx9zodY1ALBVGJ+FoydIRVC711AcnJbk7kF0M9KHKSoAPhjBr9nGchGX
	c7uAjmuKQhI1RcMrN466G6x9ORVnv23c08tLeyjGmwYIqaLoPFgzSe4wXG71ByjAt/kLlJMbZkJ
	U7Yles3HCQDvtmyxbq6t0H9VvpAB4otZyYJqz+kZT1eKQlKUkNn5DpSGPxE1n6wKGWaaMjqG+8J
	bu5g2Gbxqpx2lp6oeWaAq0h0rds3gcSChtY9yg==
X-Received: by 2002:a05:6a21:32a2:b0:3e2:4e6e:6cb0 with SMTP id adf61e73a8af0-400ae433451mr19922425637.36.1795758164233;
        Thu, 26 Nov 2026 21:42:44 -0800 (PST)
Received: from [169.254.212.233] ([2406:da1c:1ee6:2e01:64c9:ebb0:9e1:f7da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm12022687a12.9.2026.11.26.21.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:42:43 -0800 (PST)
Message-ID: <f717d85edfc29966526f156ecfcf5b9dfca23fab.1795754281.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795754281.git.n0ps1edzz@gmail.com>
References: <cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 12:03:29 +0800
Subject: [PATCH net v2 1/4] net: wait for RCU readers after flushing routes
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Hangbin Liu <hangbin.liu@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

netdev_run_todo() waits for outstanding RCU callbacks before flushing
routes.  However, rt_flush_dev() and rt6_uncached_list_flush_dev() can
release the last reference held by a dst to an unregistering net_device.

A reader can load the old device from dst->dev under RCU before
dst_dev_put() replaces it with blackhole_netdev.  A route release from an
RCU callback can then drop the last reference while that newer reader is
still active.  The earlier rcu_barrier() does not wait for such a read-side
critical section, so netdev_run_todo() can proceed to free the device
underneath the reader.

Wait for pre-existing networking RCU read-side critical sections after
both route flushes and before freeing the devices.

Ido Schimmel identified this missing grace period during review.  The
lifetime was validated by source inspection; this specific window has not
been triggered independently at runtime.

Fixes: 4a6ce2b6f2ec ("net: introduce a new function dst_dev_put()")
Cc: stable@vger.kernel.org
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261125190113.GA421469@shredder/
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/core/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index cd0796a1d..2a9d9a06c 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12039,6 +12039,7 @@ void netdev_run_todo(void)
 	if (!list_empty(&list)) {
 		rt_flush_dev(NULL);
 		rt6_uncached_list_flush_dev(NULL);
+		synchronize_net();
 	}
 
 	cnt = 0;
-- 
2.56.1.windows.1

