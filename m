Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870983;
	b=yUtkPKo+i+b/joWgTTI+C6VtZnO6bMeEs4tJoLbhkaERTu2Xy2NhcdkMjr7a46Rrp+00
	 vHMYLOLRCecAPltoNh3TeWm2n/rtA/T8DwXaghqq+5KzZiIvvmwEsZ3J8idb3LUAvZHOR
	 hVv6i+MbyEQ3OsgTSRuEI2+2PSvxEDWat+kdBF3NCOgG2D6goR5zqYEpb6yFHii1DthKA
	 D1cldyqakWAzjXFI5e0LrS+pEn5NXLi3Tu84+6i/YDZs1errgUhIowNO0l/5H8Vt1zp9b
	 3zztsiuSInQCOnPTi3QHICKd/B7pwn+oAjJdlZnSinOl3JW6VqiQSVzhUlBmCqfVxRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GINNXd2gDG9d+eQdiJhKkdY1PdkgKUfpxPo/aI6hNZY=;
	b=jhFkKNUXJ6SMDuD01Iw87BEruVmKBjfP5JDRhEwlXvYXVAAdl8Q0USo475evAWQ1MyG7
	 dKpxwB2IGLLLZRmujvbNJeDuoS65f8qiCNHv6dvWqdeDx3NJy09/1Qo20haX3HDfif7IC
	 TF+/jtxNULXIqfW0rkPsviFlQ+vIfKJVYylg5d1G6lAuJXvS+g9hLK+PR7nFqzbg65vPg
	 I7uBHAEQbJbBHRu5IuQo6tt6t5tHpOMaMDH5tgwztFotMvGt7WHBbn/orf3tejx+h7bsF
	 ++kPl21CxZI6hh1kzXolSI1wwU1ZWD1jIDjKgNwApY/1wzYkvRDcc23xug+Qx83WXLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KHerqGik;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A922606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A922606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KHerqGik
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1678641a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794870981; x=1795475781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GINNXd2gDG9d+eQdiJhKkdY1PdkgKUfpxPo/aI6hNZY=;
        b=KHerqGik5b6ajqeDAuf/qUiN0Ys9ygX4Lk0SoVxImvlo8eZFfYsvPbIAuqmYRJ4cIP
         ADEq10pjp0srWO676AizIq63hRwC0u/BcV8p/dqbl0fiUnpJMcH/IynPsEYicwxwfFwu
         gWEXCDRs7FzYVAw3fPmcCfrSHAqJKI6J1pORMwvknwxkaVc7zY4XwSJrfb8zftcJv0CJ
         T9oou+LmltO6IAPaSeuJI7gcJLXWF+KJvP+aKhamXD8UDO0SkozwGnlaN8fIx0nw1qWn
         N0hUk1uRBYe/PBulzZoz0UPNWnVCMKdT1mXJn1FZTNtvIKqh+B/y3oci5HC06NM+DnDi
         zZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870981; x=1795475781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GINNXd2gDG9d+eQdiJhKkdY1PdkgKUfpxPo/aI6hNZY=;
        b=Z43EFJ6NcoXBNb7e2t+lbv6Gem8KyBndNyVZoiVlk+NiE1xVJnR73zdVqBm+W8p9P8
         5YBSnqrad0fim6/TpNL/i+5QCuupsfr4wgnHF8gjaaVcr1UzsSszosAs0I6ddonGvNIA
         by2fqvgIuTpCMu9B2PR0f2EM2i04SFotAy34HbLy2X1BDiA/M7zDFbXdrxT88rYscRbc
         hEXzcpIzj3RP0+BXB3Q9D2zmP7GRGHtlhCumJJZKy2p2NEyEpJvV79Ydeox5Sn/VBBZo
         +nDcdvlAPTFcTA9xL1LP/aS/ptgwk4YKQMP2+4jTzS49gl+Tt7mMu/3J7xFn7mY3k05+
         4RfQ==
X-Gm-Message-State: APuU4Z8qzLYkhT+QNDWsJ9b3vX9hMKffGImpbWqCp6ls3mYcvTQSF+wv
	VqlQfbMugUabe3P6E+HeTc5ZnmOCdlTSJ6gAj1tuadid0k8R+kNjB/KhXv/k29zSjUWwKldqGwj
	ldI1O
X-Gm-Gg: AZFdTZddxMZeSGRT5E3uhBjGb0Cped1vomo2Nxn18cDXpNdfhJY6mvGLX04HhHDXbWm
	8odVT8Bgzd0o8wlJL0ITOLu5VSfZ/foeZ34YrFn5aLK++YNuEcd3GWFjhwmDEXCxzO0yNSRjn/p
	U+xZHEakOB1646I2GpB6KspHJss7fsuSB16SRjC5/3Q7TaJ/2X6bR5oHCgmpTRHSaH0bp4CNDR/
	NRbYhQIZDEQxW9KrBa3ka3poOpYyDFbOtABWOt4Prc13Plzmu6Oec5PtelayDJpTVt9jH3o5Whr
	BRNMmIJNpb39Gvn1Q0AXnQQuSz66kOeyAFzwmuEcw4GhIA9l4VpTOQvY9F4x7StdyajiW98Qpye
	8qGO9DWbrW3R5Z3nDzHCd/AZ9L2sRnpgTc2vIkyXrhfS0nTHWGVUSVP6j5iAKZazsaXYf8tvd23
	Jn/oouugSrDmob1X4C74wcUbWahRi6XWmo0I0xnKku/dlgeo61eqg58jUzBGfmrjaatgODLZ3J3
	JqjL7+U33ifgesnsoHzEKewhlitLmZr7jWNd7ULpsGijGskCe5OMSqWh94X1if7nJLACjaOs2aJ
	E4fwq2HIlfOPMFvGIQT+Vrq3D7KSGKD1zN8N18hL1Lz6YD2WqMunsmPpu44SrgzI57pR85cBmQ=
	=
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b1b0a1f097mr12455424a91.12.1794870981175;
        Mon, 16 Nov 2026 15:16:21 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d86a1sm5068075ad.8.2026.11.16.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:16:20 -0800 (PST)
Date: Mon, 16 Nov 2026 15:16:18 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Yuen Su <zypulsecore@gmail.com>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH iproute2 v2] ip: flush nexthop-object routes without
 compatibility attributes
Message-ID: <20261116151618.2ee4bf9d@phoenix.local>
In-Reply-To: <20261026102420.612573-1-zypulsecore@gmail.com>
References: <20261026102420.612573-1-zypulsecore@gmail.com>
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

On Mon, 26 Oct 2026 18:24:20 +0800
Yuen Su <zypulsecore@gmail.com> wrote:

> Route dumps can contain RTA_NH_ID plus expanded nexthop attributes.
> The kernel rejects that combination on route deletion. Strip the
> expansion from the flush copy, keeping the ID and route selectors.
> Use the compacted length for batching and retain the dump for display.
> 
> IPv4 fib_dump_info() also reports blackhole nexthop objects as
> RTN_BLACKHOLE instead of the alias type, independently of
> nexthop_compat_mode. Work around this with RTN_UNSPEC only when no
> type filter was requested. The kernel then deletes the first alias
> matching the remaining selectors; alias order and changes between
> dump and deletion can affect that choice. Preserve explicit types.
> 
> Add namespace regressions covering ID-based flushes, ordinary routes,
> batching and type selection, with a nexthop capability probe.
> 
> Signed-off-by: Yuen Su <zypulsecore@gmail.com>
> ---

In general looked OK, but AI review with review-prompts showed
some issues.

On Mon, 26 Oct 2026 18:24:20 +0800, Yuen Su wrote:

The mechanism here is right, and I checked the premise against the
kernel: fib_frontend.c rtm_to_fib_config() rejects fc_nh_id combined
with fc_oif/fc_gw_family/fc_encap/fc_mp, and your strip list covers
exactly those four (RTA_OIF, RTA_GATEWAY/RTA_VIA, RTA_ENCAP/
RTA_ENCAP_TYPE, RTA_MULTIPATH). fib_nh_match() returns 0 on an
ID-only request, so the compacted message matches. The AF_INET-only
restriction on the type workaround is also correct: ip6_route_del()
never compares fc_type against rt->fib6_type, so IPv6 needs no
equivalent even though rt6_fill_node() synthesizes RTN_BLACKHOLE the
same way.

One case the workaround does not cover.

> +	/* Work around fib_dump_info() replacing the IPv4 alias type with
> +	 * RTN_BLACKHOLE for blackhole nexthop objects, independently of
> +	 * nexthop_compat_mode. Keep explicit type constraints.
> +	 */
> +	if (!filter.typemask &&
> +	    r->rtm_family == AF_INET && r->rtm_type == RTN_BLACKHOLE)
> +		dr->rtm_type = RTN_UNSPEC;

filter.typemask is not only set by an explicit "type" argument. The
vrf keyword sets it too, in iproute_list_flush_or_save():

	} else if (matches(*argv, "vrf") == 0) {
		...
		filter.tb = tid;
		filter.typemask = ~(1 << RTN_LOCAL | 1<<RTN_BROADCAST);

That parser is shared between list, flush and save, so

	ip route flush vrf blue

leaves typemask nonzero with no type requested by the user, the
workaround is skipped, and the delete request carries the synthesized
RTN_BLACKHOLE. For an IPv4 unicast route using a blackhole nexthop
object in that VRF table, fib_table_delete() requires an exact match:

	if ((!cfg->fc_type || fa->fa_type == cfg->fc_type) &&

fa_type is RTN_UNICAST, fc_type is RTN_BLACKHOLE, no alias matches,
and the delete returns ESRCH. iproute_flush() keeps redumping and
resending until the 30 second timeout, then reports entries remaining.

To be clear about severity: this is not a regression. Those routes
fail to flush before your patch as well, for the same reason the
patch exists. It is a gap in the fix, and worth deciding on rather
than leaving implicit, because flush vrf is a common way to tear
down a VRF.

The awkward part is that typemask cannot distinguish the two cases by
inspection - the vrf mask has the RTN_BLACKHOLE bit set, so you
cannot test for it. How would you prefer to handle it? A separate
flag recording that the user actually passed "type" would make the
guard say what the comment says, and would leave the vrf mask alone:

	} else if (matches(*argv, "type") == 0) {
		...
		filter.typemask = (1<<type);
		filter.type_explicit = 1;

then test !filter.type_explicit in flush_nexthop_compat(). I have no
strong preference on the spelling; the point is that the current
guard is testing a proxy that has a second writer.

Worth extending the new test to cover it, since it is the one flush
form where the workaround silently does not apply.

Everything else I looked at checked out. The buffer arithmetic is
sound: the space check against the uncompacted n->nlmsg_len is
conservative because compaction only shrinks, and nlmsg_len stays
NLMSG-aligned since it starts at NLMSG_LENGTH(sizeof(*r)) and
advances by RTA_ALIGN, so the NLMSG_ALIGN(filter.flushp) arithmetic
for the next message in the batch still holds. Display still uses the
untouched dump. The testsuite helpers all exist in lib/generic.sh and
the build is clean.
