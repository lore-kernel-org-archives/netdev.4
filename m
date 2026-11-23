Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416691;
	b=MdzVrm4v1LkC/FFqLRk9uGhvfpzMWScp/8xPzRWX+jtrbBoVxvYdZDMr5SMDdZGgAJoa
	 FHYnUXsLoGrZt2zl9mP62p6AIJtrUSkAnoG0Wol3XcYUNCioZRaK5hnnhMe89WPLC67Ij
	 1cJwX35ScuHXMNJIA7hZo8jr/jvWruYPpWnmo4ES/6RofyQ4wYOUJ1Rlb/WnA1uum9C1J
	 G+VEaZ/IY+0vrmr8w2nBR8Mdyk0NSxOB9EUzGEsinaYHCXG1IHupfye0QFKcQ8ucWMhIm
	 U1mvn+c7+mrlnb5siyg0mLIcwLbReSL4iqP3XCUDyJPwe2OTvOhO1su1jersw31qqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=K+6B0gWoSrUledv2HKRXi0gyYw6VTPkEWeocJbaGXVY=;
	b=dxX35hIJhCGpeTe05u3QeYhM4zq6nK+3G/eR/LV7h01J8HveehYgvcCOYpgV/KpA+eYz
	 hZuFFw/1QrZ46s+db7W81JKDKDtLRSbUksX9CTqDjUEZlgkcNJcslJJIobNVpI1P9vOOf
	 QPH+9FGkTm2R3wcjX90EVgtp/Vr5vuJiAmk7MVve9NPjQBqMQwZf/p8IvuJVR6Xg6RtJD
	 sekkCq7ls6v3h7EQNNFbB9VHVkT7T+V9ek7zRIbAoLKyFeZESBVxKWytZjpTn9zeIAqS2
	 wt2OSO6Dk6AUNgkY0tyhL9QcpesWnb9/93gIs7PEt8XpnQJzjoqlx9aOURgAuaZHLyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRNna0B;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBB606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRNna0B
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2044685b3a.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416691; x=1796021491; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+6B0gWoSrUledv2HKRXi0gyYw6VTPkEWeocJbaGXVY=;
        b=QjRNna0BnzrMShDrBLER9RcS7SXIBigrkI1n4Bk+l9+Xh89Juvw5yv3CkkklTVfoVU
         grvTUapDfWPJyLD3z3a1Tp7UTWcEAtCYjcs0xV0M4CrwroRQ+LsaogwFtkii8F27sbtX
         aoG8Rlv2K5euod4K8q0y17aE/6KUeAc6Kt7IjZb8mvyyU7RLDoPAN4wf3MjfY2Yef+SG
         TA5VFEIytF2KB2JCbtt6svywVI4l8wHPVqTo5X8iIbi6Snsv1zkPdeREwAVG3Q1NJP4k
         HH6p2v2pT7DkSJ6AKpOitvVxgiHI9cOXbw02i5qukjv/n8Jqw5+LkOFvn+RvTl9kkNo3
         /tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416691; x=1796021491;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+6B0gWoSrUledv2HKRXi0gyYw6VTPkEWeocJbaGXVY=;
        b=nfiQCMlsCaNKja5zJXeVC894MbgOUeZB9Tv4QyoAi9nOCrcceLyBwI5Z54P2iizISC
         adTATXZF1EORDlyq4nRxNNdJ5pnYir21YKWqvZ8Yl94UbUf68oTcdOc5aylSsHfIGTA7
         31kQ5kaDdWcceOgkIjtsXpsNpQ+8B2uNnlrxQ3wXaeOIL+HYwUuvtjwYHag1F4JYUYNC
         Shq6g6bmyC2zm3qwuLrX42r3E0iqTD5gk9gxl81T9re7cLkd2I2kqhnnE2izPqizsbMI
         KeRj3sLzTUQ9svl91CXGZjSR97nndJwBs3HwKEa0YhY2vI5hRKfflYFobxkjeAesYCYg
         U6iA==
X-Forwarded-Encrypted: i=1; AL+hErH5gicSYmXTZHDVXyoM42vy74TrUkGZzVICC12TsHMXJikewe904YVpuRnXLddSHyKYc1e5Njg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LELn0vSEioC0NXuiNvqMlDt9uGzAujgSDjJHcVpZfXHLXNZ94
	iuqyjmOJyBtm1SDp9UXLcNtTqOXpCeJmhlUe8uTKlBg9/lpwpyQk+92Y
X-Gm-Gg: AZFdTZfSvrUn9Z5KFLg62qSzP+ryk4zOn7w+FADA4rRFgvfujtk3hZ7obTyHYODPLHH
	oS+5F4aoD/CHmxPQfxX1uPIsxnyo8eIJy5CDqcQKWfowiXqTZAN3ubosUYg4YWLXrH2KC3KgHmB
	/2DZ84LnOAi3LKnvSUyP50j2zIUTepM6/kBcT1iWL2a3dZGYhDsvOXsq7tk55eb+lR/vA5x1Wo9
	2mgo7vScMC6X9npd1JbYcJ4QBjuMHZYoZiMuk9qQAWiAEvm8dvrR9VIdZK48FMbZXRD2gkKXAGv
	eygfYq8ti6wRfu659j6Q8jawxZdMdY02+2A5f3dbcOoJaiY8Szo983P5uF0QHcwQNfiVGBDASfA
	E5TQcOiyH1eUL9KV2IPL9bIP4uSmX+cA/7Fu/qqtKXlHh6hqytGxzBviitALhIAqWEw8z3grU2/
	ggRhmr1bvlfKa6V8X54RoBOfPjDQFZhBCPSryZiAYlcNbb1fY4fLG7mTEvfWdHN+zXWoWIyKd/R
	900slf3Wm0Shn3aN501SGmtmsAxptivkFZRR15UzYwGGbhbNKiYHpaMEg7l5ImN06XqCshRe5BG
	4v/jXaVVVAD39/IR0wrdOqCsivajlUF7YqU4dm3v3nmiRTyrgluYyt2MG7FZKBXq7BB5mFNbejD
	rAg3tRbUOhugbKquDlk8GxgaLfICYiu+CQw==
X-Received: by 2002:a05:6a21:3995:b0:3e2:8c2f:4b80 with SMTP id adf61e73a8af0-4014db586d6mr7642491637.25.1795416690430;
        Sun, 22 Nov 2026 22:51:30 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344184fsm5152236b3a.35.2026.11.22.22.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:51:30 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 06:51:29 +0000
Message-Id: <DN2E3KPRKZL5.3PSJD3I9JFARH@gmail.com>
Subject: Re: [PATCH net-next] net: gro: skip the checksum of fraglist GRO
 packets
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Rosen Penev" <rosenp@gmail.com>, <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Simon
 Horman" <horms@kernel.org>, "Neal Cardwell" <ncardwell@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261123042735.139550-1-rosenp@gmail.com>
References: <20261123042735.139550-1-rosenp@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 08:27 PM Rosen Penev <rosenp@gmail.com> wrote:
> Make __skb_checksum_complete() verify each packet against its own
> headers instead, and mark the skb CHECKSUM_UNNECESSARY when they all
> match. This covers whatever asks for the checksum later: conntrack with
> nf_conntrack_checksum enabled, and local delivery, which happens for

It doesn't. This breaks tc progs.
Today the skb is CHECKSUM_UNNECESSARY when a tc ingress prog runs.
With the patch valid packets fail skb_flist_csum_ok() after the prog:

  helper                  what skb_flist_tcp_csum_ok() gets
  ----------------------  -------------------------------------------
  bpf_skb_pull_data()     2 packets, mss 536, thlen 20, all pulled:
                          len = 1092 bytes, th->check covers 556
  bpf_skb_change_proto()  6 to 4: ipv6 = false, frag_list has IPv6
                          headers, iph->ihl = 0

TCP drops the skb and conntrack marks it invalid.
CLAT has no IPv6 socket, so GRO always picks fraglist for it.

> A fraglist skb whose geometry was changed after GRO, by NAT or
> bpf_skb_pull_data(), is segmented by skb_segment(), which computes new
> checksums. Such a packet is now forwarded with a valid checksum even if
> it was corrupted before it arrived; the packet boundaries needed to
> check it are gone by then.

That's silent data corruption. It's not an option.
tcp4_gso_segment() also takes that path on SKB_GSO_DODGY.
bpf_skb_adjust_room() and bpf_skb_change_proto() set it on every GSO skb.
Willem's series adds skb->encapsulation, like seg6 encap or ESP offload:
https://lore.kernel.org/bpf/20261120044733.222627-3-willemdebruijn.kernel@gmail.com/

> At the full MSS the router already forwards at line rate in each
> direction, and csum_partial(), which took 27% of the cycles, drops out
> of the profile.

So there is no throughput win at full MSS.
With the default nf_conntrack_checksum the work only moves to conntrack.
Paolo suggests to remove fraglist GSO. This adds another state to it:
https://lore.kernel.org/bpf/ce3e6832-ca9f-4e91-8302-b5bd7cf2f178@redhat.com/

Nack.

pw-bot: cr
