Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848665;
	b=0eWDO0fdrSVn9XxLXAbPS3lWQpsB90p1KQ7eQQV+Yb+F+xHuSONSzbZ+k80zFSq5FJ9m
	 Svj5TZqP3CgCpFYXXh+sZEhhb9XbOvPcd5JV6/JYOix8xraeanqCg2cBSQwXpw7m8cEeN
	 +4KtuJmeGVf1ZREAMHtMPzuyzn8o55aso+QW4wk4836Zl4HgN7aj/konhgQXcrZEAEu3A
	 /Z7lyL1HQLIRJ+ddxBsSW68v4QJ1htRlvqV9G0I0gtLm6zsbYxQuLjo2/e9QvIpnRMBhw
	 ugz7yZnQI0HHxYnV+LMR1QpT20KdRwz2US5iw/vb3385uLvxspRhDQ41G+Af32IEmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
	b=348fTE4yAa+ySaOlP73MeT8Nhvn2wGSS0waXsIpg77eaxmu85sKzg61aUwFMAKN129zz
	 FXQPyo2OqZhxGnd39VElvlJdsbRsjh1iyCoUfp985mOk/af2L8Sl8zxSJCJ+OuYawQZWx
	 euSoCoNWnjyEvwKITedq91WnMmC09OAzYuKdJfuiAc1QyGiZ2pil7p0ouWMkKfGSmkfpf
	 v5gGuJCSLNC/hrp6OuQpEtP3n04ybHfmhZo8LUAzLgIIQ87Wzyy17JDpDpkFqP1n/feg6
	 58lTrfhe0wORE0jU+QuMuPqg+CQfowrIqqdWGjaepnlUna+6yVgCn09Ly63Hca/6H/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xh8yP6lX;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D40606A883
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D40606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xh8yP6lX
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50cc7540b7so234943466b.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794848664; x=1795453464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
        b=Xh8yP6lX+BPj20RAK/eBul9EDB6/2oy1PyKatTxPRBo9kRtGfKIX2qjIxa5c8xSAZy
         8cEXNuSoibZZB/pbA31WLxk6XqNRGu5xm+gvWnDlKkmyZz0+6OvHbG6LXkZZqrMuxvh2
         usERjfPixx2vu8U3q8mY9/qGZD7NeBfUNaOqJAFlaM3dpO4QQQYia/XuN0ACeLlmlwAU
         1tKTqFwdb4kjXTsnEn9GqPMz04guC/uUXwdSPbhUZSRcVcajS5e6Q3Y4qNlB3nTF0rPq
         Fuz1O34kiQQp9maVl1+HigJ5WTz05GQ1FL5rUN/Bjj7acV6rH+/NERK/gxzf/J+DSxlG
         +2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848664; x=1795453464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1hT+97K/K9N6aADAlPB66PeMF4gDFwltjwUCDDeJPw=;
        b=KrmneGOqKVnUKcJ7p+r7G6Pg0Bp5dNF698Nwt1x05pzGDk1cEye0l8c04bLsAN8JnM
         1ZqJbb28PZGBvsXyVXJShkOgXYZjHQSt0GGbwjcEvAINBtCqwDf0dGCW5xdr/gE4sngd
         8w8tMlBZIELpLvVZKmnzVmIPHgM8qCKIf+vWLIcExtNRyWhIsyNawHCnAlMkm7ftMzoO
         ECE9oBxu3Ir+hU6jZC7o8/IyoidKhxmXO73XIeWnqJU5bKOmEvl+yijqSst6+jIgxpPk
         BhCl4chN04+bbDat6Vpd+TCwz0H7HfOrjld4ZV6PMG3GGEEeeJFVy4u1MzclFnmKTlIG
         P92g==
X-Gm-Message-State: APuU4Z8zWKfPSVVLhinUVJY5fpcohpcZ3mtncNANpkcuDgU9HTm80HMy
	0iKScxNQRdwWotQpGlJ9OhY5XqMHIdZ70wMtIa8U/TZsW3DJkANxFLoTpSbnA3Oj/hA=
X-Gm-Gg: AYBFou0d8YEM1em4mzhNG95JI1ufjPYvp2A/VEEFIgcYW1Ck9zSMQPvBfAYmjlxIxIX
	1psM17Rb44ytw+AjFAJ9IhU4QcIPmaljT/Y13NbrHX/QoBBhLPdsRnxmPuAULrnv4SFtDEuzdVp
	aXVtau91ABY0S/7ojMObLvvjVGqed+VnG9LcTBXGJoETy6MY7E8rS6IgKTmJYW3hPyVW1W7hg0U
	yvF4f3Z03SiitEDyoMCO9FOc2cVWmxbFeHx8nGVFAVc/V/D+2UBWMzLDQNiwUY72qr2+rLQuZF2
	Rseniy2cI42bFNy5tOAdFv9USmrNsNTss7JHb00bCA1lYpC0RHUv2yEnXMVSHwRR0ugNK+J16MZ
	AzOcunyOTGbiaRANnwIYsPuijA+vnheNF/6oJ7sE+8gLJQSLlAJfYOM25BeEAdhhlIMLc6iw62K
	xpHHpJJSlN4m5yXK+HfNroPhrR+416xHauX/V2QKYgXScqE3kh+pL6+NzpoMACJmNrl195aoUUA
	peRIPUdj7A1DXBcad/+zewiu3OYdWvmtp7AMI19HvWiESjIkw8tpVr+K+vXdwjxnoN0lZilo2QP
	1LJs1QY/r/zG0P8g9fivMyr3Y6mirhY8f+C0cwkuhnR7aHo=
X-Received: by 2002:a17:907:6d11:b0:c26:2a2:b91d with SMTP id a640c23a62f3a-c509612a23fmr1038875566b.6.1794848663649;
        Mon, 16 Nov 2026 09:04:23 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b44739sm439299566b.40.2026.11.16.09.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 09:04:22 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	yoong.siang.song@intel.com,
	kerneljasonxing@gmail.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH net] xsk: reject TX checksum requests that overflow skb->csum_start
Date: Mon, 16 Nov 2026 17:03:41 +0000
Message-ID: <20261116170341.53580-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179484673444.3291.12899618485319674206@kernel.org>
References: <20261116162834.30087-1-tianyi@cloudflare.com> <179484673444.3291.12899618485319674206@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi,

On Mon, Nov 16, 2026 at 04:32:14PM +0000, netdev-bot+sinfo@kernel.org wrote:
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

Sashiko reported this several times, and I reproduced it on a 64K-page
arm64 kernel built from net at aa40afa831eb, under QEMU.

The test sends one TX descriptor from an AF_XDP socket in copy mode on a
veth device, with XDP_UMEM_TX_SW_CSUM, a 64K chunk, a length of 65520,
csum_start 65500 and csum_offset 6. The headroom is 64, so
skb->csum_start wraps to 28:

  skb len=65520 data_len=0 headroom=64 headlen=65520 tailroom=65168
  csum(0x6001c start=28 offset=6 ip_summed=3 complete_sw=0 valid=0 level=0)
  ...
  offset (-36) >= skb_headlen() (65520)
  WARNING: net/core/dev.c:3696 at skb_checksum_help+0x1d0/0x238, CPU#0: xsk_csum_overfl/200
  ...
  Call trace:
   skb_checksum_help+0x1d0/0x238 (P)
   __xsk_generic_xmit+0xb90/0xdf0
   xsk_sendmsg+0xcc/0x188
   __sys_sendto+0x128/0x1c0
   __arm64_sys_sendto+0x2c/0x48
   invoke_syscall.constprop.0+0x60/0x108
   do_el0_svc+0x48/0xd8
   el0_svc+0x40/0x238
   el0t_64_sync_handler+0xa0/0xe8
   el0t_64_sync+0x198/0x1a0

With this patch, sendmsg() returns -EINVAL and there is no warning.

Cheers,
Tianyi
