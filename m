Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953817;
	b=aQiBOofs94g8PSC2cBNSqeKSMXgl00Z1gvHhEDZeQUyT9EniN0CisLCaNTR2sXS77YQs
	 6mD3OmPe7V3wqLu9CZ20Hne28sWZ0JJNH0xDGoGvrdUxYphNxAORS2y0ZiZBBncM3aZdb
	 r9BC9pAXpiWcQb31nYnv4mmreWozlU2VU4um0DadrrBapD6vugR17NX1jBRo2OKRymaGl
	 Xcz/si0u+0ymEA9Vu5MeMSVWo4aLEQcTiKNF5Ev6mN3Z3w1+kHoJRfN1vSY+8ary+wZ0w
	 DhIcLBpyLxfzLtdVJJTpKQuG0WjHS7E/4+i+iTweCrw707eTkttoS1wwyORaA0Ilsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9XowfQhAos0l+YG+RKwhbMmXV2tpC0X4FEcNngoRZcg=;
	b=kd60Ik1rp5xXi7461rr359T1SUCh4fpAAkQ5gpZIuPbYbw5tmygc0Gv26X21e6CVeKWm
	 EnTQ2Y2nJv237amTlicT9ttXKDmAftFRngT54MBsli0hHx3Xw6tv2mZ7tr95xTWa5gN9C
	 jy3WO03Cnv9L9Gm6Ou3QrL2S25+mtBAv45aNsMWgZJskHDbk1nwN0e0fTlGKIkIG7VsEB
	 Xhu7ciT1rcOp7gYFD5tsBcsmwNnc+Z31eZj4lveYPpkLrdu+kgdEjhCnJgysuw1MiWnAD
	 1Zp27Qfvx2LwBHuoWf1RR8527q6TTfaM+Iwcc+CLDLTofHSmrWSWNS17sZ3JxBuTImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ds9ggj+5;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20E606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E20E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ds9ggj+5
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso286040a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953817; x=1795558617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9XowfQhAos0l+YG+RKwhbMmXV2tpC0X4FEcNngoRZcg=;
        b=ds9ggj+5zBLbCWS52h0oTm4Nq812atJr1gisS3fkDgkeHLupy/gFw8y+n2KMJwu5CV
         6/UeMiWPM2PCcMJhe0YwGzOntq5EFhPnT4kllUoPds7ngdmIL90KrOixm+gD6gPRf7o5
         VGmhck8xJBXPciJHqDtbxXZBiaMWjuyLHu1c6TzTlX5axawpjzkez7gkhJMbgQyV+AEl
         q8ZHD8nIwbkRWjjn/j6VG+SCVRo8DBsCvWTnPCR6qJGTiq8li2XjmIsI+JNy1K5OFjRx
         Iu+KA5kvpoGZP+9ysQN5wVui57X4FrgHz37wFoMTFPKi26r5ckxWpUVLVFxP+V26RYKU
         sJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953817; x=1795558617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XowfQhAos0l+YG+RKwhbMmXV2tpC0X4FEcNngoRZcg=;
        b=GGVuDuISczc6jAUm73InN0iC5nmbLBi5OFSmd/G+6FM+0w7c9AEuenRlkHUNXm1gcQ
         SFPazHVDQp0c18C56d4d2hueUr08m+eKzv2zY4CgATp6gsiLX8g5jIgAQnKcDgCVEqCa
         zG7ieJ9rRYtlFzJXjwLSrSv0l+y3qaZTVmv5pA9Bb9JDvU2sw16ijgvd9TfXhRYq6t90
         4sdz0WIwUU4HIW0RTruoKa46zzoeHsCYrYAuSZzLFDQQb/zY+EsmylM+3P0r9IOpwmKK
         MHWlvM4gEawPM8S9PSOJW2Cr38g/+ZPAHKdUqIrCHYPRscLoOAdcKEvZ1TLmD1PuKagI
         /p1w==
X-Gm-Message-State: APuU4Z8mvGevG7Bu89f/XzyNu5sexy67Ib/7B51DkBVOtUnROSdTGT88
	v39YbLXQ05fZASeSLljMfw+r0VAri24VFXfk3vG31GeSzaDAmZ9h8LWWMgQKgcajD3o=
X-Gm-Gg: AZFdTZf6xFvmMJBLgYBUbJpCOQ2TJ0gdTFiVs+shYiyzZc1IkJJMf+w+pbIBzFn3+Bj
	IngTN4iR0OVhM5aSFEu2mW5fzjHJZIgVMmF6xIbhp+pYmyYqrOJiNd2SkbeFpHlg2qpIeNDh7aQ
	My3h5YH6yJeyHt62q/LWFgH195AeVGrYaQHG0hK8xA/Uw4NxoIo/WaXRXWSa4dM44yQbs2+HTn5
	ZKMc12e2bn5lrpfVgpuXnEDM6HwaK6X/uhsK5GFREIZLQw1O5Cb9vM5fJnJSRhlJJ5CE1XvXVTI
	8fkbbzK7L/IKEyi2Y72Ag1gbO4aFw7tC3+8Wb/nC2OyB1IaVDNSlvj5Wmk3FjX3XBVVS2StJT+I
	4wcE52hWZI54YZ9BFqJi+PByD/a4WIFQlGXj6osydcX+7ebziPyVoIU2izFE56IydjgcIV5fiqa
	VPunb9/57cIXymyoFxBUqp1pFDTOkflZ8ay9gfgWN+vat8/Cc8voOJkneYjK4dYakcj2m/3ykzF
	K80g5zK3p2sx5sOepmoRaKwSjvJcowufIx+NmgH532RFNBI71cHQX9JwhDQYnokDbxxv6++P/Wv
	xCBCkw97hsUAfSdgmmkRD566XXCNksM3QF8/HRw9auNdgXV7si8worDCnRCFdXbgR/3HBic4
X-Received: by 2002:a17:90b:1b07:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3b3d07d92a8mr666645a91.67.1794953816946;
        Tue, 17 Nov 2026 14:16:56 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c04020sm848479a91.17.2026.11.17.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:16:56 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:53 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Victor Nogueira <victor@mojatatu.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, Jamal Hadi Salim
 <jhs@mojatatu.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
Message-ID: <20261117141653.60ce5d92@phoenix.local>
In-Reply-To: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 16:10:03 -0300
Victor Nogueira <victor@mojatatu.com> wrote:

> This is a followup of commit 9c572a83037a ("net/sched: fix potential
> stack infoleak in em_text_dump()") as reported by Sashiko.
> 
> The issue: em_text_dump() appends the text pattern with nla_append(),
> which is a bare skb_put_data() and does not pad the attribute to a 4-byte
> boundary.  When pattern_len is not a multiple of four the skb tail is left
> unaligned.
> 
> tcf_em_tree_dump() records the raw span as the ematch entry's nla_len and
> then writes the next ematch's nlattr header at that unaligned tail.
> Userspace walks the list with RTA_NEXT()/NLA_NEXT(), which rounds each
> attribute length up to four bytes, so it looks for the next entry at an
> aligned offset the kernel did not write.  The ematch list is therefore
> misparsed as soon as a text ematch has a pattern length that is not a
> multiple of four.
> 
> The Fix: append the pattern with nla_put_nohdr(), which reserves
> NLA_ALIGN(attrlen) bytes and zero-fills the padding, so the following
> ematch stays aligned.  The emitted ematch entry then carries the padding
> in its nla_len, which is what NLA_NEXT() already assumes.  em_text_change()
> only checks that len covers the struct and the pattern, so a dump replayed
> as a request is still accepted.
> 
> A padded text ematch is the same size as the request that installed it:
> both sides carry the 8-byte match header and the 24-byte configuration
> followed by the pattern rounded up to four bytes, so a tree that installs
> can still be dumped.
> 
> The kernel has no explicit bound on pattern_len; it comes from the
> request. TCA_OPTIONS carries a u16 nla_len, and for cls_cgroup it holds
> 56 bytes of nested headers, the ematch header and struct tcf_em_text
> ahead of the 4-byte-aligned pattern. So the largest pattern that can be
> installed is 65476 bytes (65532-byte options). At 65477 the aligned
> options length wraps to 0, the attribute is dropped by
> nlmsg_parse_deprecated() and cls_cgroup_change() returns -EINVAL. Since
> the dump is no larger than the request, the padding cannot push the
> dumped TCA_OPTIONS past U16_MAX.
> 
> This also removes the last variable-length nla_append() caller (sch_gred's
> is a fixed-size, already aligned struct).
> 
> Conditions to recreate the bug:
> - CAP_NET_ADMIN on the target netns (unshare -Urn is enough)
> - add a basic filter with two text ematches whose pattern_len is not a
>   multiple of 4 (e.g. 1 and 2), then dump it with RTM_GETTFILTER; the first
>   entry comes back with an unaligned nla_len and the next entry's nlattr
>   header is written at that raw offset, while RTA_NEXT() reads an aligned
>   offset three bytes later

Teach your AI to write shorter commit messages please
