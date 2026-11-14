Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686064;
	b=TQ8Gv8LC25OjFRqPk58s7YObtQpH4WnEAEY5K9b1+gXj09ShS8UVOO2C9ZMbWOZIBSX/
	 Mx48aC/qdtj8HIV/D1SU3TO/SrXzsKO7OPSFzUulv8dSEnZhHIKTrD8nVLzsZgB58eeZD
	 IZplXhasuj8s22YRo0nhN1cC6eG4XzjHLXt6GakL5/77clYMFNjyg6cFgVzxqdPVnf1W4
	 WfeayDFATQhBkasu3D88UatW4Xb6ThSrG/qh6bHIEPQ2epNM4GQ+HiQw9OTyOBEfB4Ewj
	 IAGMiHvbhUTwGod2GIABvUth7WeQAbOmrfuhO0TwPnGv02QRni59LR/idIMMRXKMT1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
	b=l6D3fJN1xbO1/4Pc+izU0qJeRItzTidiJCJFMB6m5W/Y0c3G7yDBMcMUk3xnZug5aHDh
	 MjU3EPhdSnZbSuMdDoQ6MkxEtVHQBNXrqQsWs3RyGpwO4LJTZz5fz33BPdj9lz3CNLV53
	 TtVmVXqoA07pOwFIQF4Wy96yArVgOqXAKNbQLt/lcb94r/43QsKuFT9CodzPrXFT3MEjs
	 daK5TId61GB3TvPsFZjpczU1ClUbD9XtQsMUC38AuIpiYHyGiL3F8KJCT8k6q6X/kPmh0
	 l7ewIwhFmyV8xvNTWj2+a9sdcERICilzGLp0sT1YMDQ4bP1yfd56b2ZTgbX+0fh+4tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIUueDOB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076A606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4076A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIUueDOB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso4351599eec.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686063; x=1795290863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
        b=wIUueDOBpnVCEvuV8Dp2/5jiAS+lYJl4cP2IVvXaTwL/NtbOF8E8OqpR1ki0rwgV4d
         Qec5TkPv0LlEh2Y8V/u9Q43jXt1yQmzhpMWLB2CUDZgGmaA3QxIAqDH0yKtxJgtwhT2O
         5bgWymkei0ImgUBzoSsanK+1ZWFBMKcSp9Xnmjz+usNmf59VffX6IvJ+uAMZ6x4MIva6
         Y56K6nOVKvFIOxhdmCokMLbIt0LEN0RrmXyhCSk9sOIgG4HLbEWsInMOfIhU95K1ikJ5
         o6jpnA3CHQTHjXPVjkosZKfqXN/2gs6gqXC1Ymz5ux3Fy07zhmVMY2BhXS4dnBIGDWLi
         xL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686063; x=1795290863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
        b=hJlFMsDMxwM3u8z3pAfQ9NXzaylgSchuJfaMxdwJzh+dgRXIzv+mzw3pOJR7aH3mvI
         iAu+UC3FM9fuR7s/L5/144FcM3uzB8UhLxfziYzOYv/QCgjG7vesC6eL0gXf/gO2FJfZ
         R4UBXwaPrNHXApOdeAOKB28LNeysHoz4DVaWzyBYPau4qriQUsPv3P+5OwjOvcdgdJS6
         93KxQVIQmVRGtkPgsQIZRGXZRRyUBwnctURYUO2hqusqHJfGua3JjWphZrp0y5uDyV7p
         aA2xUTDf6YaWA3kohC84P+w9J1vIVbjnVRjNmN5tkyjwBrYZje9hjir8KXG/QOkV4cOl
         LU4Q==
X-Forwarded-Encrypted: i=1; AL+hErG6vKizqwhQhnLbWcUiPeLVr1eAlZzgDQSL8wmXYo1McFG0fZjiN5cunlD/AEIX/uxI6lAeq+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lmgAg4fLYOcoK8PmdWs9BifkNHzDkWDnlGIHudj2TUkkVcDYD
	2RlRc5LDxx4CcFkC3IkAr083BUdx1ijYrTPzITDK0e1wmmdX8zqAbuZg
X-Gm-Gg: AYBFou3LXY1Aioax4fG1JpiOfkPj3qsRPk/uGvTat6aO/SN5t5i/1bxFNFVlNMNimCa
	IFQ0s+1NYj4TNWZGWLZQ+Bc7hN9GCnHmGkZvxivhmFl1is0HiOphKJ0w6RJQvceN2Tw7E5PGmhV
	+8UN/1ct5De0pvse6/1UUy0l/OgkeyZbXjkflqwtA8rm0XIHJh7lej6meTdxMyV+LJ5s8dXx0DK
	t/mc/9rlgIL+oIaklydoXRlJXEbjv3DfpFZI+ErXVlPLKJ8g14l8Fp4kec99Sr+0Iu5KVPJouvz
	nQd7gh9HdqH7saBzbYOFNpr57SSd9eAsClXtp+6izN9jH0K7tSjUP6zWu5+NV9ffsW8tztvxQQg
	LXrzZId0oMMPtSj0IKubbuFUNr/Qiz1TBvvJHYmHHk+9bLk0Rn6UwWN2qSLWOtp/6/GocjrwZmn
	+UwyK4Prv7HbSgBov4VuUoMk6SxdNrdh+c5qO3yUdvvE80MrAJMYN+6XZ+GejeqxEEaqUTcQgPn
	Vs7DG1d3C/teLnNLwfdym3Y0NCnW38GnL1lby+XqZZhsb8jfAIXIVHQ+wZFYK8qZMoQSz/77vSv
	Gx1jdRKuB3PwweaJeSlZ7oHLpQhpyz+EFvBu
X-Received: by 2002:a05:7301:fc09:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-37966a58499mr5631650eec.26.1794686063266;
        Sat, 14 Nov 2026 11:54:23 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:f7bc:3425:951e:ab09])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm23226931eec.27.2026.11.14.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:54:22 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: horms@verge.net.au,
	ja@ssi.bg
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+84e27adb95fd2a1fe9bb@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH net] ipvs: wait for RCU callbacks before dst_ops teardown
Date: Sun, 15 Nov 2026 01:24:09 +0530
Message-ID: <20261114195410.96503-1-pavankumaryalagada@gmail.com>
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

During network namespace cleanup, IPVS releases cached destinations
using RCU callbacks. However, ip6_route_net_exit() destroys the
per-CPU destination counters before these callbacks complete.
The RCU callbacks call dst_release(), which updates the destroyed
counters and causes a NULL pointer dereference in
percpu_counter_add_batch().

Call rcu_barrier() at the end of __ip_vs_cleanup_batch() to make
sure all pending IPVS RCU callbacks finish before the destination
counters are destroyed.

Reported-by: syzbot+84e27adb95fd2a1fe9bb@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af795e2.98e60839.1e023a.00d4.GAE@google.com/T/
Closes: https://syzkaller.appspot.com/bug?extid=84e27adb95fd2a1fe9bb
Fixes: 026ace060dfe ("ipvs: optimize dst usage for real server")
Cc: stable@vger.kernel.org
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 net/netfilter/ipvs/ip_vs_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_core.c b/net/netfilter/ipvs/ip_vs_core.c
index 8a3c880fdb26..9c456efe13c7 100644
--- a/net/netfilter/ipvs/ip_vs_core.c
+++ b/net/netfilter/ipvs/ip_vs_core.c
@@ -2553,6 +2553,11 @@ static void __net_exit __ip_vs_cleanup_batch(struct list_head *net_list)
 		IP_VS_DBG(2, "ipvs netns %d released\n", ipvs->gen);
 		net->ipvs = NULL;
 	}
+
+	/*
+	 * Wait for ip_vs_dest_dst_rcu_free() callbacks before dst_ops teardown
+	 */
+	rcu_barrier();
 }
 
 static void __net_exit __ip_vs_dev_cleanup_batch(struct list_head *net_list)
-- 
2.43.0

