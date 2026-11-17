Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951538;
	b=m7A6H9UZZxGkcl3ebRedgFvZOGJpmglQGYo41B6+27xH1zvQ5DMzWWJai1Hd0NMUG3Yy
	 wKtThkGsflaNymnp27zit5UwApEepWV9JREG5ekPLKkDzDSGfzQFbBdNjDROmRvNHjiFp
	 lVjCk49FKNSCL05E65sB8hhxR+22cjqqwfP9Od5KD5QrZE0VHcdiKwSZ/mzNAOZXn8Wmg
	 m29mn/DdoBr/nlwCufr8DTFGcQN4K2n9YKpu/ycuE3f3ya5pell5WljpVTMlccEW16e9y
	 ayRZsYjy5c0ZFoHG104ce3DL/6m0ocrzcv40MFvVtG1PnM8lhbepmJMH384/nlGiZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=c4SVbWSr6SCDSYMJqrFn9cFbZMaNW3W1ynxYABuiibE=;
	b=MZ3v9mkgrn6EGOwlcWlXTPNu3rFzvOoc3dPsAg7npZeh3RbjqMRKIXvhh7+4jL4vB3Sz
	 sKbK2oxtpoQdOjO5BG3d0WBxxXnqiAxzsC4sUTZojBn3R+waBfmqcqB9Vpp8rZA5Qy5HV
	 riXYS9KMelyeyyYmwrSIIMR7kXHk8oe/HUV5Ue2Q6l1r+myxVPU3fxfLsUNuyoNoxMms3
	 G8gtEUeDT35KWrXuRhbd8dAfq1aiZrXVxaps2TBKJtGL59Jn7HDEe1IOffUEmdn5DBr0p
	 mexgO264NW1qeeegZigVjt74W3Rbhe7xZWrXIjQT2STDzhOoY7cV8yG3SOs3RTMoidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EfUWcRG4;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337C7606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EfUWcRG4
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso162801a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794951537; x=1795556337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4SVbWSr6SCDSYMJqrFn9cFbZMaNW3W1ynxYABuiibE=;
        b=EfUWcRG4bKl297bfPkUlmhAPJecLJbaQOWE4CPdPuiV3jC9hWqK1YkHPJwgPQRWHQG
         IalzhLqmpoaLUZHOeJMM1OP2CO+h6MY8eU+GUoSo1Ia/danTajvajzsJOTMLU0KF6o5a
         LSa64g5H2nLPTEnTi4c8+sn573ksEeVOE/X+QsFkaezyegTlw/neIthw3mLIo+eFYwTI
         bOv3Db3eKENmGKZRjvZeHT+FIyb388t3G/kPibNtwW4qOd2K7Gy6yAWmXPUs87BEjdL4
         rvgbccwNPXRnds1Qp14ydahptWVC7p2eaLGqIg6USbHZeNLlsG3mmCZR1e8zX/SKdQNb
         bQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951537; x=1795556337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4SVbWSr6SCDSYMJqrFn9cFbZMaNW3W1ynxYABuiibE=;
        b=0tZbtlkLMRp7n1qwUMhN6cq+K0i8syQk2mI7z2XGnsWb46fkoCKCSDsqNf32PgOnch
         63vEPePosQJAxmqPRs0AwOhI0r3SLvzinUCUzpPmDHZMhRGgv9XmFnxXRp0KjQ7PsqkM
         c4R+ywrGe97LV5hnfEsJLyz88OQTeK4olfGQImBfn1yZ4lTrgSMbdOZMzPhOwo3shVj0
         x3axIkuMAXs6qG6cHkSod4KBMpTbTgy+tN801/6oMdphEptB70lCrgx7WfxvWWQzfr/6
         H3+GGJywAsxd2iFle3r8zliEfs75m873tVgbHiiWjKjtUgFiiMp1fDKHoH2sD3QkMQO2
         67LQ==
X-Gm-Message-State: APuU4Z8eAPEvoGVgranwo+Is3Ydw2AN02T7QeHDJRQWi30LuZE3sSYmt
	nWkwgejztCc7QOEKN2j3mMWKd6CW4lEEbK1cZWFbTLe3qGPS+dcBpdqXhb+q2ou6lgkdEF0yUVn
	FyvcF
X-Gm-Gg: AZFdTZc6d25IWezXVFSDX5ZJA29UnKiBcrqMtu4eHknHKVjKMnVl82m57tl8285rNMh
	LZAQ2UlKngYJ1V6WxSuvOtk36uErJc/R3WQiGCAA7L4XQX3yZ5HWkFtelX45ZYWOU6eGk26b3rt
	/NEx6dkGdHh8ok8vFirfTEQXkVA/yMwyJ56ohEUDDuvM11FuJ1tSvnNMngr6o6WRV5chQH4bN+r
	NUei5AjPkJ6XQ0eBBo5MdpddwoOq+TrpigDoymVXJ2d8ISvMW9Oi+l9qzp4AY8Wpdxty++j2dCV
	GzKMQUvlHmbaOwc0p7kF5fo5VNRxRXu9xWJ4kGJFWLMbvk5a0enUa7lWNN4hdFSoPiGKGT9tR54
	W4M1b/VaCoMJXrb2SrbO0Sssd2zL7rC4e31rBYj8ixG933uABrGz4bBiSmJv+d2YqeCPZctLhpU
	Jqa75SkG6mjJKiCuGcW+0XMdp1EBMppk729+ktIuo6hut/Kqc8QkhhEjw32cwPneuYadghMhTlJ
	rpC/hhUO267ehmxSzO88SJjfNGD2whK2g+/rOUSciF4J+7LoqMvywQdBIIk0Zc3Wb6fJrFO+0v1
	440HDcqI9JreRn5wKTpFFDi+SsucsoOFrHOE9ntNcaGmmSYrnsObqiyRWSOtv+L7N1AqgGR+8Q=
	=
X-Received: by 2002:a17:90b:4b86:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3b3d06a5b8amr665503a91.8.1794951537185;
        Tue, 17 Nov 2026 13:38:57 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm694664a91.10.2026.11.17.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:38:56 -0800 (PST)
Date: Tue, 17 Nov 2026 13:25:41 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Yuen Su <zypulsecore@gmail.com>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH iproute2 v3] ip: flush nexthop-object routes without
 compatibility attributes
Message-ID: <20261117132541.03df0f80@phoenix.local>
In-Reply-To: <CAC9WPdy-t24XJXdPjDLP5ZZWqTJpkqy3OmvZsrOpr3qB9S_y0g@mail.gmail.com>
References: <20261026102420.612573-1-zypulsecore@gmail.com>
	<20261116151618.2ee4bf9d@phoenix.local>
	<CAC9WPdy-t24XJXdPjDLP5ZZWqTJpkqy3OmvZsrOpr3qB9S_y0g@mail.gmail.com>
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

On Mon, 16 Nov 2026 21:25:37 -0800
Yuen Su <zypulsecore@gmail.com> wrote:

> Route dumps can contain RTA_NH_ID plus expanded nexthop attributes.
> The kernel rejects that combination on deletion. Strip the expansion
> from the flush copy, preserving the ID and other route selectors. Use
> the compacted length for batching and retain the original for display.
> 
> Blackhole nexthops also hide the IPv4 alias type. Track explicit type
> selectors separately from the VRF default. Without an explicit type,
> clear the synthetic type for unfiltered requests and for VRF requests
> with scope below LINK. Local and broadcast aliases cannot have that
> scope, and deletion still matches it. Ambiguous link/host-scope aliases
> retain the existing failure.
> 
> Leave IPv6 blackhole dumps unchanged: they can hide a local type, and
> deletion does not check the type. Stripping their expansion would allow
> a VRF flush to delete a local route that previously survived an error.
> 
> Extend the namespace tests with the VRF case, explicit types in either
> argument order, excluded local/broadcast aliases and IPv6 retention.
> 
> Signed-off-by: Yuen Su <zypulsecore@gmail.com>
> ---


The version you sent is corrupted by mail system but there is a bigger issue.

After looking at this in more detail and at a higher level, the root cause
of the problem is that kernel is buggy here, and working around it in ip
command is the wrong way to handle it.

Pre-nexthop the ip command could just do flush by getting all the routes
with show and then turning around and feeding those back as delete operations.
Somewhere along the way, this property was lost. That is the root cause here.

I am not taking this kind of workaround in ip, fix the kernel.
Yes it maybe really hard to unwind broken route API.

Long winded AI prompted analysis below:

On Mon, 16 Nov 2026 21:25:37 -0800, Yuen Su wrote:
> Subject: [PATCH iproute2 v3] ip: flush nexthop-object routes without
>  compatibility attributes
>
> Route dumps can contain RTA_NH_ID plus expanded nexthop attributes.
> The kernel rejects that combination on deletion.

Right, and that is the bug -- in the kernel, not in ip. Flush has always
worked by taking the dump message, flipping nlmsg_type to RTM_DELROUTE
and sending it back. That round-trip is the design, which is why
print_route() does a bare memcpy and nothing else. A dump the kernel
will not accept back is a kernel bug, and I would rather see it fixed
there than worked around here.

Both halves of this are in fib_dump_info():

	if (fi->nh) {
		if (nla_put_u32(skb, RTA_NH_ID, fi->nh->id))
			goto nla_put_failure;
		if (nexthop_is_blackhole(fi->nh))
			rtm->rtm_type = RTN_BLACKHOLE;
		if (!READ_ONCE(...sysctl_nexthop_compat_mode))
			goto offload;
	}

1) The compat expansion is emitted alongside RTA_NH_ID, and
   rtm_to_fib_config() rejects exactly that pair:

	if (cfg->fc_nh_id) {
		if (cfg->fc_oif || cfg->fc_gw_family ||
		    cfg->fc_encap || cfg->fc_mp) {
			NL_SET_ERR_MSG(extack,
				       "Nexthop specification and nexthop id are mutually exclusive");

   So the dump violates the kernel's own input validation, and
   nexthop_compat_mode defaults to 1, so this is the default path.

2) rtm_type is overwritten with a synthetic RTN_BLACKHOLE. The route's
   real type is destroyed on the way out.

The second one is why I do not think the type-guessing half of this
patch can be made to work. It is trying to recover a field that is not
on the wire. That is also what the changelog is admitting to:

> Ambiguous link/host-scope aliases retain the existing failure.

and the IPv4-only/IPv6-excluded asymmetry falls out of the same thing --
the clobber is in the IPv4 path only, which is why ip6_route_del() never
needing fc_type is not a coincidence.

The clobber came in with

  4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
  David Ahern, Jun 2019, v5.3

which added RTA_NH_ID and the rtm_type assignment together. The sysctl
arrived later in

  4f80116d3df3 ("net: ipv4: add sysctl for nexthop api compatibility mode")
  Roopa Prabhu, Apr 2020, v5.12

defaulting to 1, so the unacceptable-dump combination became the normal
case rather than an opt-in.

Either kernel fix makes this patch unnecessary. Having
rtm_to_fib_config() ignore the expansion when fc_nh_id is set looks
safest to me: RTA_NH_ID is the authoritative specification anyway, it
keeps whatever display value compat mode has, and it makes every dump
already in the field round-trippable -- including from older ip
binaries, which this patch cannot help. Dropping or relocating the
rtm_type assignment handles the second half. dsahern is on Cc.

On the iproute2 side, if you want to carry something for kernels already
deployed, please split it and send only the stripping:

	case RTA_OIF:
	case RTA_GATEWAY:
	case RTA_MULTIPATH:
	case RTA_VIA:
	case RTA_ENCAP_TYPE:
	case RTA_ENCAP:

That set matches the fc_oif/fc_gw_family/fc_encap/fc_mp check exactly,
drops nothing else, and needs no argument about types. It is a
self-contained fix for the subject line. I checked the mechanics and
they are sound: flush_nexthop_compat() reads the original n and writes
the already-copied fn so there is no overlap, and the buffer bound still
tests the original n->nlmsg_len, which is >= the compacted length.

Drop type_explicit, the RTN_UNSPEC relaxation and the scope threshold.
That machinery only exists to paper over the rtm_type clobber, it is the
only part of the patch that is hard to review, it needs fib_props[] and
fib_table_delete() to justify itself, and it still leaves documented
failures. Most of the 176-line test is testing that logic rather than
the fix.

Separately: this v3 does not apply. The mail body was reflowed, hunk
headers included --

> @@ -766,6 +767,39 @@ static void print_rta_multipath(FILE *fp, const
> struct rtmsg *r,

and the last 27 lines of the new test are missing from the diff; they
appear earlier in the message, between the diffstat and base-commit.
The hunk claims 176 added lines and only 149 are where the diff expects
them, so un-wrapping alone will not recover it. The Received header
shows gmailapi.google.com with HTTPREST, which is the usual cause.
git send-email avoids it. I repaired the reflow locally to review the
code; the C hunks apply cleanly once unwrapped and build warning-free.


