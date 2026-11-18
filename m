Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795016034;
	b=bsNXgs0Q1kg1suWuZB73gdb+MaC+7SJt53FhNID7kyF6VBj+f2KPTi9W7p7TeZqSnVkH
	 pltoVNDUSXscX6qvmcIna+TwmSAgZe4oRtdqrVyzVDVMevX90h1znRsb9cjkgBYMpKXDX
	 +Y7A55beWiu31cIjhP4ZE1VmY4JnOJAGkFlRDBLOsVOBAHmdeRPLmpAvw5rhb0vpRBp7N
	 clJ1M9J9Vns9J44zc5DkE1fVBbNnPCQli/sM3BWDmUkzU6hqLXBCo/4RAQjDrmU2/evoG
	 cUePtKcKymY5LuXso26X+lbMr6nIgbaJ43rHy0Zn9Xbgl+6Iz5wHX3dSNm3E+gsqqXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lWrCVJWLesJnIcVUok2QlZd+ly33TndKetEhrY+zgk4=;
	b=EjotKdyEwjH+t0iDhipGb7eVtjx4OY8R9ikpwAWBsxola1wK0F5DFn1NMu5njnxf8a9R
	 MO+ZD/EADgNvSvk4A828bJMkEA8grsSZVK2sz2Rr/L8ULvbxujeIR/aq2V1c/99oNDfuK
	 HIktI7ra+o68tI6Nod+oyzjI+SqIcXkHqQmsTJfh6I3ektxEpcwLR1/kK0JCX8wX29hfP
	 peO2gH2grvaPSQd6DKtpn9JWtRr7wPilfDHndDboKYxKc8odujKJw/d4yx8GU3gTkOYLY
	 1utLXHMRFo2utls8IaIQ9+xEP2MKVY0Weh79MgqVTah8qKMJVuR1Q678m5Zv7R5lyTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVXTjvFP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3303606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3303606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TVXTjvFP
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3ad31c004d8so5593481fa.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795016032; cv=none;
        d=google.com; s=arc-20260327;
        b=SQS6rVGWFxdTCpx6CxUIb6aOqDR4NuH6RtC69VlMKX7Yi75gHg6LX8tH1jrh9NDgD/
         dhwJifQoMkZCe6N6ZSZD22q1x36Qj/VNcrxCjvef4zMgPWApGBf/6fN8YZl8XCOeayR0
         CyGtYGfJnv6bJo3/i+PgjNqj2PYq8XCRWYnXevXRWy4mPMdlZot26vq2Ay/35PnmQYK5
         sHfwjy2LCwkTDLV3M3F/1Cr56wKzQZvDUpuSFxeZWrLOacH6dGnhQmPEIrT+ELhfaCHs
         EsKaXQt6uw+OK6PUVJjez/VFuFBJebYlsC4ZvOsDRqM+q4q/SL2sBclDF6YcV8FokGuc
         5ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWrCVJWLesJnIcVUok2QlZd+ly33TndKetEhrY+zgk4=;
        fh=VNT6R6+rPyaFaQ2ePUNlQljxIW2+ymjSELrWHRDGzZU=;
        b=CjW1qHdtUOTynwtkF+crW/WvQeBeI28uuYlVaTmOpZI6j0Li3EILsTMYrv3exsownl
         WHZNAZ6RgjAtXl7Yb1RoHrMVxCXx7yCQGg3/kGi+o94gotsOr1acaW+3SxJRC2AtxGTp
         E1Dppba2X7ow89A+X5F2EJizhn5uNgrU6XfisNde24Vh6ZXYeSNEZ0wzLxaE2nA4mHTo
         zTQ+UmvG1SkuF92T4KSkQXDM/dT/fdJA8ULIxA19u4UUgNDR6rGtQutVlZux+xL34ppd
         2S/wJBGjqbvuh6IieOhXMBAyEkXtQmK2HO08A5LwAcTwsbYyDAMVfp1Y4uxCBEPmXCPW
         cWJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016032; x=1795620832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lWrCVJWLesJnIcVUok2QlZd+ly33TndKetEhrY+zgk4=;
        b=TVXTjvFPXhzc/bLEx+ZoM6GYbNLHu0lXds4uZhiPohiurv43e2An51C/moLDZn6r6p
         j3dJb1dPwshv3xWv43juKXtN4ffDqcgfrVWnA3rozDpb9p+Yu/25cE2FwpGjOjelZj8x
         7ri4xTBUOyO+x4rYdHCFN8/EcBNmL2FX85iQTCkIc/1RYmvMbHPPDHw8UFiffINAIMNr
         kSy2zo5qljS4cqeNaGTla4fgwYX12ykGsocfKTdllG2dD5hxX4J/Ip3Kz8ONcd5O3bFV
         ByBMEH5LorYevTS1+th5TTWR30f/G+ClveLX1sLMV2CSLC1igIvViMFEunbJH0N6R39k
         v/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016032; x=1795620832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWrCVJWLesJnIcVUok2QlZd+ly33TndKetEhrY+zgk4=;
        b=fDEr3bv/K1lNM0Jb5AagImFIg9BGKPQ/eSCN3eu5hmU5uXTrLOTBRks89ou2VZZExt
         SL8TE8WpyZlmCquTvJ+sclW3r8Gkb1H7WnGSkgLPvpeV4xM4YbLEBmxEfw1XI5jMxm2Z
         eYL7y1Is2UEYS/34u8ATkb++yB4EegkGeoOteUf8XSxVRguwoMmtu0aP1EsKGjRVi/5I
         mFJD/oeO4Zmv9Y+eh7QjiZ/bGGUfcu6O0d4gMHTdB7KXIbBCG9/Ks+5ohjySU6rrexNN
         ERnpTIB39BRcsKak0z0wyPnGoyXMuGLdoJ6tRklTabcuJo7b+66WmIQG6AnLpqtcIT0Q
         yoSA==
X-Gm-Message-State: APuU4Z9t1j9+1QpFSj5qTJc/YsmmAB/lTvXSmkLHrX9mqLSJNTMTv2Vr
	TDSxy0EbnT3tl0x00CqHYXSkT+L8WP/CHPOwTbzbm3wT6b8oJghD5CmS+uVhBZQR4yQQcF4kr50
	uCs6l3kHMhfhIxcrxUW3SUx7yrFLqTzc=
X-Gm-Gg: AYBFou38PyEZIXtKRJSEjdh5kuocDaSEqUA/ntflyV+lW2xQEDyyBPnEZOXOe5SaRcn
	fW8LTsSjfwC00qHf/qhN8UHlvMjrnuAB+ZvkK55oj1g3dpD7GLuDRiU05DUaV+E3XLAYVoui3gL
	FuSvdWE6TiR4dFu4bQSX1RbkZTSh1Ynptsxk2H/x3ZKIoGFXhQcvRjJmIjHfLlv5O1lTUUGDw12
	8YbRLx9uKzVoD1Umicj2Fr0nJTI6fvU0syVAbnlKMkLT16Pt3WiwgnAorbQTROMmDbEBgii5zRM
	YvMKRCrtT02zbpUFRA9Y/KN+vOl3iYVmIoxIMmLflugCy23YQ73lsgL+ni6ajeasqOi3K8J86aX
	0d1/cljppSa7BClKNUXdoPabGEy9FnI8BKnURd3Y=
X-Received: by 2002:a05:6512:10d4:b0:5bf:a12b:9ba8 with SMTP id
 2adb3069b0e04-5c1aa2a82b2mr954623e87.65.1795016031617; Wed, 18 Nov 2026
 07:33:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115152408.48205-1-shlomojune6@gmail.com> <179492922969.3136.7887984434455212903@kernel.org>
In-Reply-To: <179492922969.3136.7887984434455212903@kernel.org>
From: J4f J4f <shlomojune6@gmail.com>
Date: Wed, 18 Nov 2026 23:33:39 +0800
X-Gm-Features: AclHuK_34vwhIVJ-WP0ppE9rmwaXeEQwWTV-oztY6Pf9rWosEEVQnDoBmiUwEAo
Message-ID: <CAE_Lbw=mYME61mRgAJFh1CArWPwL34yUyJGPrBkrpgk9VPxchg@mail.gmail.com>
Subject: Re: [PATCH v1] net: sock_reuseport: check program type on the
 migration path
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, edumazet@kernel.org, 
	kuniyu@google.com, pabeni@redhat.com, willemb@google.com, davem@davemloft.net, 
	kuba@kernel.org, horms@kernel.org, audit@example.invalid
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 at 23:27, <netdev-bot+sashiko@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] net: sock_reuseport: placeholder Signed-off-by trailer in commit
>   message
> - [Low] The commit message says loading a BPF_PROG_TYPE_SOCKET_FILTER
>   program with expected_attach_type=3DBPF_SK_REUSEPORT_SELECT_OR_MIGRATE=
=E2=80=A6
>
> --
>
> net: sock_reuseport: check program type on the migration path
>
> This commit makes reuseport_migrate_sock() and reuseport_stop_listen_sock=
()
> treat a reuseport program as migration capable only when its type is
> BPF_PROG_TYPE_SK_REUSEPORT. Checking expected_attach_type alone allowed a
> SOCKET_FILTER program to run with a struct sk_reuseport_kern context.
>
> > A BPF_PROG_TYPE_SOCKET_FILTER program can be loaded with
> > expected_attach_type set to BPF_SK_REUSEPORT_SELECT_OR_MIGRATE and
> > attached to a SO_REUSEPORT TCP group; both steps are allowed without
> > CAP_BPF.
>
> [Severity: Low]
> Is "both steps are allowed without CAP_BPF" accurate for a default
> configuration?
>
> In bpf_prog_load() in kernel/bpf/syscall.c, this check runs before the
> SOCKET_FILTER/CGROUP_SKB exemption for unprivileged loads:
>
> kernel/bpf/syscall.c:bpf_prog_load() {
>     ...
>         if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
>                 goto put_token;
>     ...
> }
>
> The sysctl starts at 2 when CONFIG_BPF_UNPRIV_DEFAULT_OFF is enabled:
>
> int sysctl_unprivileged_bpf_disabled __read_mostly =3D
>         IS_BUILTIN(CONFIG_BPF_UNPRIV_DEFAULT_OFF) ? 2 : 0;
>
> That Kconfig option is "default y" in kernel/bpf/Kconfig. So on a default
> kernel, a task without CAP_BPF (or a BPF token granting it) can't load th=
e
> socket filter in the first place. Unprivileged users can only reach the
> out-of-bounds access when kernel.unprivileged_bpf_disabled has been set
> to 0.
>
> Could the commit message mention that the unprivileged case depends on
> this sysctl? That would help backporters and security triage judge the
> exposure. The code change itself is not affected by this.
>
> [Severity: High]
> The author and Signed-off-by trailer both use the identity
> Linux kernel audit <audit@example.invalid>. That isn't a person, and
> the .invalid TLD is reserved (RFC 2606), so the address can never
> receive mail.
>
> Signed-off-by is the Developer's Certificate of Origin described in
> Documentation/process/submitting-patches.rst. It certifies that a
> specific person wrote the change or has the right to pass it on under
> the kernel's license. A placeholder identity can't make that
> certification. Nobody can be reached at this address if questions
> about the patch come up later, so this can't be applied as is.
>
> Could you resend with the author and Signed-off-by set to your real
> name and a working email address? If you're forwarding a change
> written by someone else, it needs the original author's sign-off
> followed by your own. The code change itself is not affected by this.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261115152408.48205-1-shlomojune6%40gmail.com

Will fix it.

pw-bot: cr
