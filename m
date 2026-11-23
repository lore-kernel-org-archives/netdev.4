Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436022;
	b=ihIZm+jQIMplTjPcikpO7C1ZpNxvHy2O7rFBJS/6sNgzgrhw3nVrzg3YJ8K1K6B5ynCF
	 iEitslMW6VPd96k7+XPVcaPuh3234eghLIoqnzRQ1Wb4YGFmsulLGgGxCBVC7RpZQ5hvv
	 PAyzFzM9hzZp0becmIKxnDaF2eVHjVqScQ/O+F7KFvkEw9dt2/h1jXmqnL/dHEWMysRhK
	 PRpYmcQWs9H/IwsYUTZoNuYN6QRqVBPbs7up3w7I1Y25Y0bO3pbVHZUKR4YnQbKuxs4Jt
	 bTl715Y4Fknpk8Mi3XAxu5R2u3Ktpmr+ixAdEC4MjvEsCu02hHgtgFzlAlQ46H2gNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uZh81Patjg5SXBTd35jRhp7Z8jCjOHuf1P6cwMNCRTo=;
	b=ywlz1rUX5vGfXtpS3ulck/wuPGR5RcCpr1YpTxdQZaNuitL59pmR+gw+QNR1jBcySE7u
	 c8P5xLBCCJu9FHlaZbY8hUoJ5Ea4FsahOb7D72rZ1Usq9DwtVthhf23EVrOezE1hZhZgR
	 sag/c0KeCwC60/fR9aaeRiPo2/LjsUReRKcH5BHl3c9XP6++WkBiRk4FdFhHxHhQujA13
	 znKPn/JffbNkmrdjNaKoHGIeNVx1/a7L4lgI6nCspGX0r54yzZeu6tb9zadrVMPhcpO4I
	 iAfSsuNfDCAYX/JAvVKhWIcZEdOu87TH4Pe3+U1cANZkaiMt2bSe0M94hl8mciUm0sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ8uRzpp;
	arc=none smtp.remote-ip=74.125.231.75
Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF61606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF61606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQ8uRzpp
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-462dec1c4c5so1587666fac.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436021; x=1796040821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZh81Patjg5SXBTd35jRhp7Z8jCjOHuf1P6cwMNCRTo=;
        b=GQ8uRzppCrSAFj/ldXPJN9BOk6XTK11npre3CPqjqxUgfrTJ7bXESlWjA0Do4oOC2X
         jBFq36MStqMpQ14eg3YmnN5Q+s0VQKsJSPsE8HR/LFIMXy9ztBSztLC/LUx73FuPfk0u
         1IY8ZtqzeXWt8DqHwm0px+gkjtQfNgjKQVFzt7uJLo94dZJxXLo8IhubauZfFhYtulK2
         P7kZ5ZGJyxHZab3/GJ+dKUnBy3Wq5i7lqHOen33RODD03/Vu2c5OK3frDRWHrYSVEt0+
         2U/eFWqu9dfv1n4dOxqFqiZZ2boqUkI5aXafVvUok2o/HjJcw5h05Yejeq3s1Nd4Svvw
         4I3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436021; x=1796040821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZh81Patjg5SXBTd35jRhp7Z8jCjOHuf1P6cwMNCRTo=;
        b=nSzz7yTLfWzwOCwU0Ueuv6Nao/7IseRjPs9gOyQZyj2zL5MBCMCXTkkA2a+xiYXkQg
         CR7ZltGPXCqGgymKESdRRd7tL1c88rfJjv8k8ij9Gz+9XA646ME+LTty3lWYs1rQF5U/
         6buiM0O2NtU3YLJYNj2dDJwIW8Yg1sUqBGuWxTMWCjztI5I8/W31ANv/MaM2dv6TXl5V
         +vf8OErnWZkAvOLp8YeZL7i7X22uaETsVCMZgjo4OWCSv6LmGtVvbBECArwocXxftFOE
         X91+ggIMTwN6MvZiQP9wfRqt4isdFf443VxlHqOcl3a1CUxRo+Rh0TTY0Fc2f4JN5tNK
         nWWQ==
X-Forwarded-Encrypted: i=1; AL+hErHVogxcZp0rCwZOfBADP5kJWr1NQOlzSBZ6FZSZ0Eqb/BfKQNNyH91xGThtXOukIbQI9NGL28k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mBgTig2Vrx3s7Bfhm/udBJFeBONdXOwzyFgShwn2tVpvm3yVs
	o9IbIFX6vylN5yMjxC91aNDe5aiCYuhO6SF3c14el/SWo0x87F7r7NCC
X-Gm-Gg: AZFdTZdP/cMxGaH0mcIix22zEYkDYKi62AbaNrQ3v5LxfB5b+HxlaKMuZGzD68gH0ct
	VjYbQFDqGHLu40Zd8QwIZGtwqwo+bi/vU91+dgN/RvyBiv7XY6G3cY+5+K3DKsV26I1D5/qp2m0
	V02mslynPn8DKpE0jT8wBDRK9MsOUDFnS1x02rVBj+fzxGLm5B+1CnCMe8Mgu6RyOGPaDNhvI3s
	drN424i+pLYA1LLscpcs31Hy1e3sLe6iO3+EFSE/u0legxOuGK4gYEq3W9iElgB8Eu5FGobNGy7
	Fswlv8M/711hIcWy62YMnmdsQ/hxw4MQypXVVkRaFJOcohE+LRzkH3Gj3JpyRMFxtJ4Z9J2+Kya
	B9o4yItaI0djQaXvjrd51z/bHgxVzKW5Dolj/lcOr6hDKGYxhOfmzUBUBpc7DzsV6ZYnAl88AK2
	EyLccSPBsEwAJaOSwB/QO5QrJMQ3ODTSMQg3il5EMEgeDk0bT/ZIWtz6REY36n07Z4EG1YlsvUD
	j95KXHGRbki9iJ2dHsZflWFTvA4sIqnOnVpfvFVZ+950rTMu08K+ZaK9lhzmIUW82TEjloFA6EB
	AYK1P4s0MIhNU1Z9BAbg7KKJsDmJ9AyUB6ASxOT+ykoucHA4OUtJAf0LLLjgonAHDrEg
X-Received: by 2002:a05:6870:1764:b0:475:e2e9:4f54 with SMTP id 586e51a60fabf-4bc8540032dmr9275570fac.34.1795436020855;
        Mon, 23 Nov 2026 04:13:40 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm10063431fac.0.2026.11.23.04.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:13:39 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	sdf.kernel@gmail.com,
	nicolas.dichtel@6wind.com,
	sigefriedhyy@gmail.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net v3] net: zero the tail of ha->addr when allocating address list entries
Date: Mon, 23 Nov 2026 20:13:25 +0800
Message-ID: <20261123121325.3137049-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

__hw_addr_create() allocates entries with kmalloc() and initializes only
addr_len bytes of ha->addr, but the dump paths emit each entry using the
current dev->addr_len, so an entry created with a smaller addr_len is
dumped with an uninitialized tail.

dev->addr_len can grow at runtime and nothing flushes the lists.  While
addr_len is 0 every addition collapses into one node, because
__hw_addr_add_ex() compares zero bytes, so the test adds one zero-length
multicast entry to each of 64 tun devices and switches them to
ARPHRD_IP6GRE (addr_len 16).  RTM_GETMULTICAST then returned 64 entries
of 16 bytes, 37 with non-zero bytes and 21 starting with a kernel heap
pointer (e.g. 0xffff8188_04857ee0).  tun has to flush dev->uc and
dev->mc in TUNSETLINK as well, which is a separate patch; qmi_wwan raw
IP mode and the HDLC attach/detach paths change addr_len in the same
way, so tun is not the only case.

Allocate with kzalloc() so the tail is zeroed at creation; the explicit
ha->sync_cnt = 0 then becomes redundant.

Found by an automated static analysis scan (Tencent CodeBuddy Security)
and triggered at runtime on v7.4-rc3 as an unprivileged user.

Cc: stable@vger.kernel.org
Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")
Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmail.com/
Link: https://lore.kernel.org/netdev/20261118125443.1137177-1-edumazet@kernel.org/
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v2 -> v3:
 - describe the test setup accurately: one entry on each of 64 tun
   devices, since all additions collapse into one node while addr_len
   is 0
 - point Fixes: at cca8ea3b05c9, which made the leak reachable from tun
 - link to v1 instead of the earlier review thread, and link to the
   companion tun patch
 - note that other drivers change addr_len without flushing the lists
 - state how the issue was found

 net/core/dev_addr_lists.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..9613c8a9ed7f 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	alloc_size = sizeof(*ha);
 	if (alloc_size < L1_CACHE_BYTES)
 		alloc_size = L1_CACHE_BYTES;
-	ha = kmalloc(alloc_size, GFP_ATOMIC);
+	ha = kzalloc(alloc_size, GFP_ATOMIC);
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
@@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	ha->refcount = 1;
 	ha->global_use = global;
 	ha->synced = sync ? 1 : 0;
-	ha->sync_cnt = 0;
 
 	return ha;
 }
-- 
2.43.7

