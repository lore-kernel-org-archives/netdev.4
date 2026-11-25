Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597675;
	b=L4HD31T7L8kF9Jh7b8UnEDmSHc2f0KX4kikxb/A+wqjH4frH1I5kXZKU0XFdMtioH4ba
	 5o6vIeh4wl1WlmqWaiAddFD4PBpsoB2mM7VS0n1n84eBE60gWXTxYz9/2t8OADq030F5W
	 wn1YhKxTDWZZAN2ybt87NIVPYKMw15nqow5+ZQkdLu4F0QdwT81DnocH3/+xL9kvBtJqj
	 UgGRNrtzXcSObr7nPZbB6s0LczGPrsm76s8Yei/677UWqgImCG7Tkj40daZNqYFqqJvoQ
	 InYcOiyr3X5d4hDYM/RF7kbhmdEKyAe01AoOQwcT1UBiGYeUqZwnrpw4h95LQVW7XoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=2SrnLqwi6obns0/0mQLix36QghF6a+1nH1591GRlSFU=;
	b=MHSkgKfzHN5xuFYl4a4RtAZnTeu5E96dS6RtAlvILB+Ot3kaDQjnPQ3Rwtmqy49nlhIO
	 rhhqsdaRBZf2nFMBsxQ1lsh4/fAlOmNK1G3/ExPoeshU5fLCF35Bq7R2yobpAPNJR8Cef
	 CTqUWEBVSj0X9eOP+C3gGmzOFSEm8FBGsbakhB5xVS7VBFdOmoUfj6E8y9++ro5H9A58A
	 Knr9Uo2ItxphFgpN2u/U0t77f+8FwJLpO6f/NdfbBDFlTal7mnv3gYE+Y1JVHl9gaztYG
	 +HCASO5Bixa1Bi5R+49zVCZV6XSM0JCeo3dCFR+5rr67mZGwUi5nGslMsvusYUl5l8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SHQExxKO;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17F606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC17F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SHQExxKO
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so2030618a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795597673; x=1796202473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2SrnLqwi6obns0/0mQLix36QghF6a+1nH1591GRlSFU=;
        b=SHQExxKO3kd0BSeOrE8wPd0NW5hm98ifht3L5i9Vu0gdWsCXJ/lcHQC/3dtvJS11FI
         xCYWMwidXSdTpVUHLz9E3lqPM7/T4U/xjMDeA0B7n9InVibiXxcrgScS/dREwiwzk0zR
         uy2Qm+ZY/B/sFU9lMxFBhZ7KwpBOiCiTAlWWwaLMBWfbzcZcLJLtWQL5/eJgP0TxfOQE
         iUTUXUjRqgQ7NXXVwNOz/jGweD/r8FmL3ngoibz0+vTzKY5MLsdZ7iQRuLtyYnr6J88a
         FL3eeFinwL2VZFA8WXkIY3DWycA/t1cNl/Nv1YIwwIk3ygsZEDYc46hWlFcxZA6rUKv/
         8/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597673; x=1796202473;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SrnLqwi6obns0/0mQLix36QghF6a+1nH1591GRlSFU=;
        b=e128ObP/3tea2coMrmogiCH+5I8mJWnqyE4InmHLTCZI708bamyEoXHq7Ets8tZ5t1
         KBwgZNDrcCBHKYxBXLoP73EYbXqaHbAULpKaL3+4f2QAqzJYxdGhYLf/pZvY6yNyoJIE
         HLi6AVfBUzGNT/sJ4Uzsp/PtYHvOiHc1czBpCC4/tBINGs9atli4emCvoXHrVx1u1qqi
         ZaBn4c+WmhsrqY/Nffus9bedmbu1odOSQAJjBsVQpuT8ASw3fIXp0KhJ0Yfm6fOXD6kH
         kgS5RMNCuqqfAonHXxq4UVXWlGWDK2udXAekCAlVDUZPapPfisoqLVl21Q99FGjG194e
         xCCw==
X-Gm-Message-State: APuU4Z/oikDLhsGY1SYzfwTNZWa1Z+PO+1EodjmAHhm4KazlfSpWq2SX
	F0qGjktB+OkpkMcLhbhgJ6c8v5LmAoTmquzmPIyTmr/gpeMFPOiWmYwfJtYEZmCp9bU=
X-Gm-Gg: AZFdTZcAKztoIT9429pjgSjU/CbBbga8AYbD0u8eyrgfcqrhQqhngt7mo2HWw8SfwoM
	MZUTiT79CwmekOHIlNZGas8TeSEvuqwrUmgLkYpAo/1bxMyPUJctPR6OTfV61vCBVyxnTwsA9Ik
	hi/8P0kjeFDx9bIZD0CIqVY4q0zfegUkjXwlNia3ebQ9AU6KwgrK2aEEofQUxGHe7bhf0LLvW7c
	Ja9A5+9Tpn7Pv/sd6fO7KutfisHv3N5c5muquC/9UmMAEZAsSN8j2R4zEEJrFbs56uWh3wOA6HV
	/2Kgu6uACKl1FXCeAQUT9SoH9VmjfPH+ZDkmcbU/ROBEnBtmRxDtgkHLd5JH6u0jMslumMO53I4
	AuLPtEkagLl/a8wJktS9g7SjsMGzdMZ1+PnhIGyVfvJur3IyL9g9GNW/vwLQ0dg2D1PguQ7WBWS
	reORnmCHN651xnJLb5cnlHxtExVn2tItOk1aWcbw4bouxbTwtPqMcfBc+xcLYgvdvnqYO3H5d6p
	uA99PolKbC8ns/PDnWMRdf1pclMzM7NiPgb9CXt/K0xAYf/SWuHKiCWQFfAZjv1etKCIzGEKr4o
	xEMVpauo/x2sxe9xLKQTfh8R+1FaQAOe3MjLGEa/3zXXRmV2f5C0MWupPw==
X-Received: by 2002:a05:6402:51d2:b0:6ba:6f75:9d44 with SMTP id 4fb4d7f45d1cf-6ba6f759e80mr8443781a12.9.1795597656119;
        Wed, 25 Nov 2026 01:07:36 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm6152930a12.36.2026.11.25.01.07.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:07:34 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Paul Greenwalt <paul.greenwalt@intel.com>,
	Alice Michael <alice.michael@intel.com>,
	Eric Joyner <eric.joyner@intel.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP program is attached
Date: Wed, 25 Nov 2026 09:07:32 +0000
Message-ID: <20261125090732.69233-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com>
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com> <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com> <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com> <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com> <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com> <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com> <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com>
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

On Mon, 2026-11-23 at 16:17 -0800, Alexander Duyck wrote:
> Any reason why you couldn't just strip the GCS enable flags from the
> rings when you add the XDP program in ndo_bpf instead of having to add
> a check for every packet if the XDP program is present? That would be
> closer to what they did for the Mellanox NIC and wouldn't be adding
> code to the hot path. Then it is just a matter of also adding an info
> message that you are disabling this in the log so if somebody does
> have to figure out a regression it should be more obvious.

Thank you for your valuable comments.

Clearing the flag in ndo_bpf alone is not enough, because
ice_vsi_alloc_rings() sets it again on a VSI rebuild, for example after
"ethtool -L" or a PF reset, while the program stays attached.

In v2 I will set ICE_RX_FLAGS_RING_GCS in ice_vsi_cfg_rxq(), which runs
every time a ring comes up, similar to what mlx5 does when it opens the
RQ.

v2 also logs an info message when a program is attached on a port
with GCS. I tested it on E830 with attach, detach and "ethtool -L",
and I will send it soon.

> Thinking in terms of what the final fix for this might look like,
> currently the drivers are already starting to carry stuff for frags to
> determine if they support jumbo frames via frags or not. I suspect we
> will likely need to do something similar when the time comes
> indicating if the program can avoid corrupting a checksum or not when
> it is stripping headers.
>
> I am not super thrilled with the idea of this becoming standardized.
> In theory this would be much better if there was some way to pass the
> data out that the frame was mangled and what the checksum adjustment
> is to the total frame.

100% agree. We should be able to tell whether a frame was modified,
keep CHECKSUM_COMPLETE for the frames that were not, and give XDP
programs kfuncs to read and set the checksum status.

Unfortunately, today there is a big gap before we start that:

- [1] lets a program read the checksum status, including the
  CHECKSUM_COMPLETE value.
- [2] lets a program set CHECKSUM_NONE or CHECKSUM_UNNECESSARY with
  csum_level on the skb.
- Nothing lets a program pass a corrected CHECKSUM_COMPLETE value to
  the skb. [3] lists this as future work.

> As it stands we are probably going to be
> getting CHECKSUM_UNNECESSARY on everything even if we don't expect it.
> For example I don't know what will happen with an ICMP frame sent over
> this tunnel. I assume it is likely just discaring the
> CHECKSUM_UNECESSARY since it isn't used.

From roughly looking at the code path, ICMP does use it.
icmp_rcv() trusts CHECKSUM_UNNECESSARY, so after decap the inner ICMP
checksum is not checked. TCP and UDP are the same. This is the decap
case left open in [3]. E810 and mlx5 with XDP behave the same today,
and this patch does not change it.

[1] https://lore.kernel.org/all/20260715-bpf-xdp-meta-rxcksum-v5-0-623d5c0d0ab7@kernel.org/
[2] https://lore.kernel.org/all/cover.1794281983.git.tianyi@cloudflare.com/
[3] https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/

Thanks,
Tianyi
