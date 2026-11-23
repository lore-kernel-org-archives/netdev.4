Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795400978;
	b=CvX1lbo4RAvPxENxyQku91XF21K4dpS2l17ni99pztfHSnF76Iy9UI0bv06SyujB58Oe
	 z17uGuBpGO6wyqemz1i53JoDHkSMFxQV1Rt0woCPMfUVROsEcdmzoO0TumBg7FVZ+UxtB
	 7jWz1W4Q1XCRwqugsgrX745eumoDN7upsw3nDQ4iebSRUJqqgDhpodzLHoB7odEWxl/vd
	 ETsrUHMDxlN7RHadDmZom11GlyqFIaj3GjujbsBXKzUc6QgvoRHPQPilHbPb5F1k9Vkoi
	 0UAiigHEfxu33ApISnBnCpBBQx7weNIpISLhBtExgiTX/OqiwRtliRL/uFmf+V+dqmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qPlxoz5clbiKguSyQx0Jj++s2dMq5VhL0bDwBvBrdbE=;
	b=FhU7a8IgbM1KSA0thQ2dqnEgBamw7ZH3cVVE/EgrSTd3XSqex/NVkC9LwQHXFaRCUA0+
	 oOh4Tk5O9BxNjh3U90jkxAWcvJrAuctbhtQFu/p5FPKxZsOuOGq0PvJKJXaeOZJVLmouj
	 0hCATYj2N9B+ApQiBe3NJfAjWpProe6s7tB6ZVCbiBH3JM6aU6JVhL0lmW+RQHbrNUvJV
	 OT0LOBgDjRCuf9eQHg04GjEL1MCQwzk0O0xYWExaqxSy7FQiqpmHl+muki/nwx0YQgXN9
	 rtu7miJ/BaWWmt/fqCIO2xj8CZ7n/mpZY/w3QhlNFkGX3d4AIbkLQuo9mWD9H7NxHUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJdfSgny;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69500606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69500606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJdfSgny
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5430f70c827so37795331cf.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795400977; cv=none;
        d=google.com; s=arc-20260327;
        b=jRBMqIXvbv7q5RvWCPTr1d19WHXb86Vx2cO0UgVpnWOpjB0xjeMvd3ATyPpTCIJeXr
         OPJGnkzLgkM53H9WhTAQnSXpbqZ2ZV1TQ2ds+rH8x+tVnEeKnL9nDXDQ2+1ENna/3hcS
         o8YTbDE3xtXgitdpR6R6S53J/8mt/DE6ncFOUCLgxwVMXbvkh3Td12e26pKp05nGy6uI
         k71+aQ8LVG71YnP7+wAP11twIAcuw2RS39mx8hL4pLbtINKNuSAG0jlKQ86Ev49IFl/E
         rzfl7tghueEHbeSaDxSytRK9EPSQ+WnRhjPsZ2y32nUBPeLZHvP+UIYULPQbMmyiPTFz
         lkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qPlxoz5clbiKguSyQx0Jj++s2dMq5VhL0bDwBvBrdbE=;
        fh=faxsrhtt1n47Gt4W//9s2HXsD8lrpkLX2H+pNjldq3c=;
        b=QMyIxICbX3vfClvDVioauyqpbcYCJjRvF1hRvLFSMTtVDcBNSlkBFdX7dOf7Cd3TAy
         zeNIIybLfF/CBVih/055r4mYsp08JC3lRLqHcnlaGNxetZ5G4WEMYe0SI9zhmlhUxY4O
         8hzWRkZe9y9h4amQNam3tVNbeExWZFBQPlpaal2phMacJPi+5PBhDUALf8dGxGYdUshZ
         LckrN9g0tLToZ89s7RYiyH4M9dOIJ2XanViuEen8YttL1CYpxLKUzmlqwG9+AWUSvihV
         O+hAxfF68Rb3kZP5AqaIUa2nin3nt7R9YQkYDKy4XMlyzfOuua0saccN9MBkOvmTC7DO
         fzHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400977; x=1796005777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPlxoz5clbiKguSyQx0Jj++s2dMq5VhL0bDwBvBrdbE=;
        b=eJdfSgnyeud0ugF7+oZKixOJncRtXAKpA5ceSl21fP/iB+EJhxkPf/lWhNcNnqiD4a
         dvtHNIhPxlRp6RSdH5nbRdzw1yWS97bR+hHbJM/n85KdA/8G5U5UxpC2XLWJi2J5xncf
         WgDFiPjLcqWrO12HBzfKWgJ0ghjfZ4SPosUty9HXBzokq6KYSeBnNuEh9pPTnTiSd9oW
         0MdZB+wiFVZNn3cqp3bIa0ROkl74bKPTvj6iIXriLfI9mLUisPB+Gjq94gM0Irez5evo
         Th1tJ0Q8wPqy+KIxbCl8j8N+5IR4J9j7d/K3dDz9VubL39Ll+xVAPEvidlkHbH7rtl3a
         Q5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400977; x=1796005777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPlxoz5clbiKguSyQx0Jj++s2dMq5VhL0bDwBvBrdbE=;
        b=YS1W4NAknIElq3P4SFcPG9w1Jx1L5OoER3ceh9SPWFkHtvoUEfgXMXSbVWfEDtF3JL
         S9KndE/d9WhVuV9zMh7X6t/4//P8aWnFURrFkYudz04dqNA2LCm2+ETiJqm+W4IsTXLp
         9XulD+dAwWGp7yRuKS7l7GDEkozuwhmdGEDLPhiVOWTm3YAMU7Yl7yJcbev8DkbsSFMR
         lUBfzTcWtiATLSUEr25xvgY+VoiUpVdvo2wsbDJuBizkcBHujZSaebN73Bwhx2Uz1ROB
         OqFuu9DReP7hHQSxbKxQNuXd1NfGKJvO1Zm5lK7KIoT2kJoCO1hFNsw5z2gorsL7rrVO
         cKqg==
X-Forwarded-Encrypted: i=1; AL+hErGtklvfjAO9XYoRt+vULZof2PZWg8ICDYNavfas4G1eL6B+rBBLkg1DiE61+oiZGDdzq/ByclA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+22vG+e0fBGt4rzYZUu4d+yXTOe4UMLdl64T+uDpDAj/7obx7g
	7gPexfK4GLkeKAr+9BXhKy2sOpK1u40bk/ezFfp36drhuBoh+EZZ/4s5jkMfwimrAAvTfJQ4IAU
	6ZMbmC1uFTnw1i3ad/OvURASU3QrK1+o=
X-Gm-Gg: AZFdTZc77EvHF3edxn56kdOMI3WzNQZi4yR8LzyGcOuBOOlIKZoK8gyPpxSOGCB4HF7
	5FLHwriaI2Sp/FwLkp5E2CWV2KdU7XnU6F002O8mpL4D2FuwDP0reJEgIftWyjjFHz5cMMqkGUK
	qMsjTdpZdsNFOolRlXq0ZE7DQUiu6a1LyZlu2dYl4jgJvO9v6H3203uuAmCd4SN0g5OvkdQoH+O
	XNrdYIu4TODxdD7uYDwxoHxkUStagWjLgck3H1ABEcjWgv5iJMwwE/m3HqYeZrf3Vn0uik4FRI/
	goOpnoq4qbHHb7gxLGt4svAySr3q/rygfSr0elJkMFj+yjRRGSLFolEHDb29r9xlK4gTSPDYGo2
	UHT7GszSlntqwEH9Nyz+0f/5QCKpnw9xCqswPzmQ9kOoA0fey5abV8cIU4dzeuSMXcyuior2ucr
	ZOC8FO1/v22tyt0KIDj96rCAGV8SM/6A6waBOAFNAiM1z33icxXX/+CwO569ANqabVf1irMFlUg
	0z/LuBxAZaui8p8SCf0UdH278WVF+Od+v3eFMk1u8UpjH4GhAkchlLPY3Nb7tbmB04MXGCwHys/
	XU8NrGtjKp8=
X-Received: by 2002:ac8:5f0c:0:b0:55b:fb2e:a754 with SMTP id
 d75a77b69052e-55d768a2509mr200104651cf.8.1795400976999; Sun, 22 Nov 2026
 18:29:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122013848.14287-1-jain.sm@gmail.com> <179539800944.3135.14978978337031412574@kernel.org>
In-Reply-To: <179539800944.3135.14978978337031412574@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 23 Nov 2026 07:59:25 +0530
X-Gm-Features: Aa3M54pzQTEDW_gplLwb_hWSpvJYcv-CRsWKNxPf8T-ayTtusUL9-helZqYNMhs
Message-ID: <CA+FWx=kTXUJanSicS0dUeeuratAj4wTmjwbjjqT7RmDepH1zrA@mail.gmail.com>
Subject: Re: [PATCH net v2] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, justin.iurman@gmail.com, horms@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Both points are fair.

Low (procname): yes, the temporary table should carry .procname. v3
sets it.

Medium (64-bit parsing changes): v2 changed more of the 64-bit parsing
than its changelog said. Rather than list every difference, v3 keeps
proc_doulongvec_minmax() on 64-bit, so nothing changes there, and uses
the string based parser on 32-bit only, where the sysctl does not work
today. The remaining differences of the 32-bit parser go in the commit
message.

pw-bot: cr

On Mon, Nov 23, 2026 at 7:10=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] proc_ioam6_id_wide() (net/ipv6/sysctl_net_ipv6.c) changes how
>   writes are parsed on 64-bit in several ways the commit body does not=E2=
=80=A6
> - [Low] proc_ioam6_id_wide() passes a temporary ctl_table `tmp` with only
>   .data and .maxlen set to proc_dostring().
>
> --
>
> ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
>
> net.ipv6.ioam6_id_wide was handled by proc_doulongvec_minmax(). This
> commit replaces that with a local handler, proc_ioam6_id_wide(), which
> formats and parses the u64 through proc_dostring() and kstrtou64(). This
> fixes 32-bit architectures, where unsigned long is 4 bytes and the old
> handler treated the u64 as a vector of two 32-bit values.
>
> > diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> > index 1a0a36dcdabc1..61c28df64d582 100644
> > --- a/net/ipv6/sysctl_net_ipv6.c
> > +++ b/net/ipv6/sysctl_net_ipv6.c
> > @@ -30,6 +30,48 @@ static u32 rt6_multipath_hash_fields_all_mask =3D
> >  static u32 ioam6_id_max =3D IOAM6_DEFAULT_ID;
> >  static u64 ioam6_id_wide_max =3D IOAM6_DEFAULT_ID_WIDE;
> >
> > +/* unsigned long is 32-bit on some arches, so handle the u64 here */
> > +static int proc_ioam6_id_wide(const struct ctl_table *table, int write=
,
> > +                           void *buffer, size_t *lenp, loff_t *ppos)
> > +{
> > +     u64 *valp =3D table->data;
> > +     char buf[24] =3D "";
> > +     const struct ctl_table tmp =3D {
> > +             .data   =3D buf,
> > +             .maxlen =3D sizeof(buf),
> > +     };
>
> [Severity: Low]
>
> The temporary table passed to proc_dostring() has no procname. Will the
> sysctl write warning then print "(null)" instead of ioam6_id_wide?
>
> On every write, proc_dostring() calls:
>
> kernel/sysctl.c:proc_dostring() {
>         if (SYSCTL_USER_TO_KERN(dir))
>                 proc_first_pos_non_zero_ignore(ppos, table);
>     ...
> }
>
> Take kernel.sysctl_writes_strict=3D0 and a write shorter than 24 bytes at
> a non-zero offset. That write reaches warn_sysctl_write(&tmp):
>
>         pr_warn_once("%s wrote to %s when file position was not 0!\n"
>                 [ ... ]
>                 current->comm, table->procname);
>
> This is pr_warn_once(), so a message that doesn't name the file would
> use up the only warning for the whole system. The old
> proc_doulongvec_minmax() path passed the real table here.
>
> Would adding .procname =3D table->procname to tmp be enough?
>
> > +     loff_t pos =3D *ppos;
> > +     u64 val;
> > +     int ret;
> > +
> > +     if (!write) {
> > +             snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
> > +             return proc_dostring(&tmp, write, buffer, lenp, ppos);
> > +     }
> > +
> > +     /* an empty write changes nothing, as with proc_doulongvec_minmax=
() */
> > +     if (!*lenp)
> > +             return 0;
> > +
> > +     /* proc_dostring() would silently truncate a longer input */
> > +     if (*lenp >=3D sizeof(buf))
> > +             return -EINVAL;
> > +
> > +     ret =3D proc_dostring(&tmp, write, buffer, lenp, ppos);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* a lone "\n" is invalid, a continued write in strict mode is ig=
nored */
> > +     if (!buf[0])
> > +             return pos ? 0 : -EINVAL;
> > +
> > +     if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
> > +             return -EINVAL;
>
> [Severity: Medium]
>
> The commit message says:
>
>   One change on 64-bit: a write of two numbers such as "5 6" is now
>   rejected with -EINVAL, instead of being a partial write that sets the
>   value to 5.
>
> Does proc_ioam6_id_wide() change 64-bit behaviour in other ways that
> should be listed too?
>
> The length guard checks the total write size. But _proc_do_string()
> copies at most maxlen - 1 bytes and stops at the first '\n' or NUL:
>
> kernel/sysctl.c:_proc_do_string() {
>     ...
>                 while ((p - buffer) < *lenp && len < maxlen - 1) {
>                         c =3D *(p++);
>                         if (c =3D=3D 0 || c =3D=3D '\n')
>                                 break;
>                         data[len++] =3D c;
>                 }
>     ...
> }
>
> So a 24-byte write of 23 characters plus "\n" fits in buf without being
> truncated, yet the guard rejects it. The guard also rejects "5\n"
> followed by 22 or more bytes, and a value padded with 24 or more bytes
> of whitespace. The old path accepted all of these, fully or as a partial
> write.
>
> Is the comment "proc_dostring() would silently truncate a longer input"
> accurate for these cases?
>
> In strict mode, a continued write at a non-zero offset now returns
> -EINVAL if it is 24 bytes or longer, and is ignored if it is shorter.
> The old proc_first_pos_non_zero_ignore() path ignored it at any length.
>
> Because _proc_do_string() stops at the first '\n', "\n5" or " \n 5"
> leaves buf empty and returns -EINVAL. The old path skipped the newline
> in proc_skip_spaces() and set 5.
>
> In the other direction, "5\n6" now succeeds, sets 5 and reports all
> bytes consumed. Meanwhile "5 6" and "5\t6" return -EINVAL.
>
> kstrtou64() also skips a leading '+', so "+5" is now accepted. The old
> path rejected it in proc_get_long():
>
>         if (!isdigit(*p))
>                 return -EINVAL;
>
> Two other changes are only described below the --- line, so they won't
> reach git history: 21 to 23 digit input is now accepted, and a lone "\n"
> at a non-zero offset in non-strict mode is now ignored.
>
> Could the up-front total length check be dropped? After proc_dostring(),
> the handler could check whether a terminator was found within
> maxlen - 1 bytes, and decide explicitly whether data after '\n' is
> rejected. Any 64-bit changes that remain could then go in the commit
> body.
>
> > +
> > +     WRITE_ONCE(*valp, val);
> > +     return 0;
> > +}
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261122013848.14287-1-jain.sm%40gmail.com
