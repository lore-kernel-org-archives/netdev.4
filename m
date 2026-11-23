Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471461;
	b=VlLG3GSzgsSqNkqfrL6OLenkl6LaO1Q4/ttBKfTJwDlmC1rFOI0tyE9faQHYTCfkDrC9
	 LgW+kCeP4k5/9g7G9gcwB5dPaOYXU80aPzkvj04A0fAP40Q40MIn/EOAsDGdSsYYYd7UN
	 /YIaWrMlfCpYmfsj+TT8TDCH3AX86cIRZPNMf4U/knPpRIkBMBCkRlIPsmiCwtNXxSkXg
	 zZGWChFp4kCeHo4JUG0A/UxI4T9u2YXTmxNX7VNLJsvmXgjceYIJplhpbSKdTsBc+1k89
	 sxQWwtpUxinAA8Kc19ukYVLwt73STUX3ZiJzhK00RCAJJ8X2rQd0R6o5n73BEqCF55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
	b=I97afg51x483OkDAEfHwkIJxUWTYf58dUPsjcJuSLMMkk32Djaeq5k1i2GAw19pyoouU
	 2anIaG3o6/y0hyZw9VggtaA3DjkTWwR4dridAGSY29D/LLuGMUMiu9+j0EFCbhKd5kaZ8
	 GSfYXRmBdClr9hPHR9bUrY7e4BVZE98FW3b8eeYa3vbSD15Jo5yyNmfI0hDzPBMq1261Q
	 cN7oyMoR92voGrKNPThF2btwPDbRK14NBYkDnxtoPLR8mxjXfEHoaxvuSZkqTb/Xc+k6o
	 zOnV83MPdunkKdXW146lmypmbeFBW+/WzHJMPK9b+faVHsCgKXQOwyF/+vJyWn4SRgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtVnmpzv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2B606A326
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtVnmpzv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so40486885e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471459; x=1796076259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
        b=wtVnmpzvYZCD0GaLZu5xfru9ELcjZM/X3gc10J+KIN5n8p5arnhGlxvdZtuiEyO+SF
         mXICRZeaJ2Yi+kfmmdhQdJJsugjTetjy6sSEz9ogL2VfZiBVbHasEkV22gWyrwSX/9iG
         gXP5KWXVdP09JEupsR0PUyqFKWnmmNcnY1K6WK4XNiptsVNjkbR83Oe++P10kA8oCycU
         syRoavExVO4TMq6Rf94nzquu91XYDe0jrE3mOWRkel5ldFIFYGjyxM9BnJB5iIqlQKty
         ZwnmN8MZDypLgKC1fNGIYoSh2uoC1c1DYQyWGPsAypQxJiD5h5LhoNSwIqSiXUZTNEJA
         rwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471459; x=1796076259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f3F7pReyCVh5ohj9DIUA9RqsDOv9jV9G6uqHApB7O0=;
        b=DV8x+3bRCETXkaW+BiFZXd9Opqc2sZ/v+7zfR697KxZg58gpgTWN0gDblpFv/zXV5W
         HvlSxsT4U1MJFwnGLKczS1GOkvoHEqKOuFuNFjlWzWjZYM62xJIzaqQiVQJPqO6qUEIO
         lpp3dlGHt1Vya+8i2iMHAxwfdwHPGlRh9YAXhkVZqG6SHpI6MQcAcWQlMpJwtPNLZ5MX
         0ou5BVVi8IksHylecdSmoGFb64AeiQzPHYUPLf5H3ymTwZO62I4onP7HRs3dHCoGrOKX
         iGPi087dZ4Dq1thhsFMS6/j4l75HEwadXg1I50Nj79W+kVZ8rfN1Sdeb9C56BZAs3P5/
         DoSQ==
X-Forwarded-Encrypted: i=1; AL+hErH1SmJrJtIN4FE2f9sXhwyMNEG//opLH8vw/+To0HYD3ibf0/mbbXaQd3syDDGLvyfpu1X/GAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XdBoEt3Ng3jIqae/3ESzs0F31q8cYJf6SYwpmRecTwOUdVNip
	vaZDppBB050ChJ0io+D9M+h82xE3bxTaMz7aEW5zHk4Y3aIuz14mtzvW
X-Gm-Gg: AZFdTZeqTrE68K1iNO0sa3kZHmH4UWN76wneJXiZkHfAqvhp/u1UTWKarO580JMK2ua
	N2Nb+aRtEzvoRtGho19snEp1O5w+D6h9ltcvTWD3bxCrYYsy8T0Z5GHokFJxXVbHxJJ8l4C5tUI
	8ttC/JpFwvGZMluJwAaZuN4u2NRszlgJPCvWsWD7P0fxFx8QDmHtwQStXT8I5kV6finjSUEROAn
	C7uyEXmYeINdEzA6EqJGVBCHOGEKYjrD0UGZXC0YaBwd6OWkM7ruz9cKtNOBaehOaKXBD6gE2a7
	fnqOBkP14LMNj8F0rRRGKV7y0gltgWAM5Ho7hEIC5dbaePh0E9LVjx+nN3XvVrBJEgXoDouJciI
	NF7T8DU4kh/AYMK7R79WWzF/bGTEzYez84Yoar5Gy8NuBpPZ3AzQKYl7OobP/b7i8hns3y4VY4W
	/nz+EXJ9S7m5OAGK0Yy7Ns9j/P/N23YdIncyBKOB719JpQ1dDoUbqC2wwYBjzDLSgCHw5u2DIte
	DLjnTwB+Nvft8dS2cgT2BVnul7kNozFyKbXUdkYITqLFzXeKIFf7daAChHHF4bwSx8Zah2XU56n
	bAVD/AL+5n6NQCD8
X-Received: by 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr302199135e9.15.1795471458927;
        Mon, 23 Nov 2026 14:04:18 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm324214035e9.9.2026.11.23.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:04:18 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 23 Nov 2026 23:04:16 +0100
To: bot+bpf-ci@kernel.org
Cc: leon.hwang@linux.dev, bpf@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, kpsingh@kernel.org,
	matt@bobrowski.net, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 7/9] selftests/bpf: Test tracing_multi
 link_create logs
Message-ID: <awS4YG9LyfxIbE-m@krava>
References: <20261123152743.19629-8-leon.hwang@linux.dev>
 <d3920bd7ae0cc6a941895e00534e8f8818402a673351894d0bf98639272f7d7e@mail.kernel.org>
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
Content-Disposition: inline
In-Reply-To: <d3920bd7ae0cc6a941895e00534e8f8818402a673351894d0bf98639272f7d7e@mail.kernel.org>

On Mon, Nov 23, 2026 at 04:04:41PM +0000, bot+bpf-ci@kernel.org wrote:
> > selftests/bpf: Test tracing_multi link_create logs
> 
> TL;DR: Test issue: the migrate_disable denylist subtest's skip may not trigger
> on !CONFIG_SMP kernels, since the function still exists in BTF, so it could
> fail instead of skipping.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_link.c b/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> > --- a/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/tracing_link.c
> [ ... ]
> > +static void test_multi_log_denylist(void)
> > +{
> > +	const char *msg = "Cannot attach to denylist btf id %u.\n";
> > +	const char *target = "migrate_disable";
> > +	struct btf *btf;
> > +
> > +	btf = btf__load_vmlinux_btf();
> > +	if (!ASSERT_OK_PTR(btf, "btf__load_vmlinux_btf"))
> > +		return;
> > +
> > +	/* migrate_disable is only in the denylist on SMP kernels. */
> > +	if (btf__find_by_name_kind(btf, target, BTF_KIND_FUNC) == -ENOENT)
> > +		test__skip();
> > +	else
> > +		test_multi_log_target(btf, "fentry", target, -EINVAL, msg);
> 
> Is this skip reachable on a !CONFIG_SMP kernel?
> 
> kernel/sched/core.c always builds an out-of-line, exported
> migrate_disable() with no CONFIG_SMP guard:
> 
>     void migrate_disable(void)
>     {
>             __migrate_disable();
>     }
>     EXPORT_SYMBOL_GPL(migrate_disable);
> 
> while the denylist in kernel/bpf/verifier.c adds it only under
> CONFIG_SMP:
> 
>     BTF_SET_START(btf_id_deny)
>     BTF_ID_UNUSED
>     #ifdef CONFIG_SMP
>     BTF_ID(func, ___migrate_enable)
>     BTF_ID(func, migrate_disable)
>     BTF_ID(func, migrate_enable)
>     #endif
> 
> So btf__find_by_name_kind() should find migrate_disable even when
> CONFIG_SMP=n, and test__skip() would never run.
> 
> On such an x86_64 kernel, bpf_check_attach_btf_id_multi() would not deny
> the id, the link would be created, and the subtest would fail at
> ASSERT_LT(fd, 0, "bpf_link_create") instead of skipping.
> 
> Should the skip check the kernel's SMP configuration directly, for
> example through a __kconfig extern, or should the comment and skip be
> dropped?

I don't think we care, but if we do perhaps we could use __rcu_read_lock instead

jirka
