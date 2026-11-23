Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475973;
	b=yqV19yq9mGMqOwjm/UTKOMKDJOEQZdz9zWqUc4jtQQh1MJjpOtWlPFAFQdgnepQN/oJI
	 +g2eFjQBZps8XfuOr3Pq5AwguTWS3mB8/2O/YFdxn1NrBu4cd0SIsmtjlDR5H2YFfGBv1
	 rmnBasAHZaR0p32u8/oEBTZSe2gfto4oB/jJczecJ3uqeSuhNgOPN+mk53i7/V1pCUNiv
	 9XBHjE/mBjYqHEn9V5dV9ZYiGBhyzj0mKuO+FYvR5bqs0rkdKslCYjb3HMbb4hB2UXf3R
	 4ym9lWv7p4wnhXY1aSnkFBTwOTs2Tibpi/IL96k+cSZhlcUdJXArH8VrEXNmE0DFeyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cLhWqv/VagBjB5zuhR0ieKg5bnQX3hK7LoyWZzsgt5I=;
	b=0y7BoS5vy6YrQNvELB9YZEngWkPbdt1Lbdl1SEI/XwPJAUF/NGSvEdjeZylPQsIMbNAN
	 eeGPI8jIC9wJKqQOjac8xQ9doB296V1LoyAhG0XgrjmVy3Sj9JJJ4yy/TMnf3c6hjI4Ge
	 F0MeiptR8/bwLllcOpZejat6HyhzULx91ac++4ptDCdBHgx9q9xc2uIeqDA9Cd5mR7mBQ
	 DtQrSNqFPj2rzsJPnow/o78JzO5YvhWitPY0YS6JgcO4cuhZv6b1yOc/ZNW7RHNMtn/n9
	 1aY5lgDstvxmM6BqW715GlMQciN1X3QvOH5B6GvZ4pCsIuc6imgcagljA8aBib1ttlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YhXtktK3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55C606A322
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F55C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YhXtktK3
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccca948203aso3305491a12.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795475971; cv=none;
        d=google.com; s=arc-20260327;
        b=UPnjo/5FkNp/tXWm0tBrXHiWIPp1F7n7+wFEElPNlMjmLwx7BUpJ04R/tjfOgnF3Zp
         ghKTM1XG1su6hSi28C4JH/sec2dcWZXBQ3G7P+t7c9Y9EJfjmIY3iAkUw+waHRkiBi2f
         4hLPcguf0OWsTxWCm79dOYF+0u+Gpbo6VgUcr6kAEhNdGYpHKkMKlf26/+8xgTRd7DHV
         Fulwi3lveVU0OrVZsYktw2dFtXISsL2R6rs1h5gAZlu3HhokjI9YEl9iR5mgZW0DjSSL
         PXIjA4LGs7hmgduIM5WF8yU/SpqvBqahUkolNhVKAMoYaefAZnk4f0wN3N8ewqF5ajse
         mjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cLhWqv/VagBjB5zuhR0ieKg5bnQX3hK7LoyWZzsgt5I=;
        fh=LwGXyVwDQAO4+AXdbGsv99w8ytT3Bm4G5iFPxjDice8=;
        b=g35NKUFWhjvhrlSX0nQUZAiRjbvV0nyTfUM4W5PnvIQHEfXxtDvW2maAmwpQN0b6qy
         zeHUyTf+6OpmNxWJuflG2tnXLC4tp/+wtEWNI2GEo+71XZBna+ixoum8UelkQfksMy61
         0DxLEYSyUgGb5vV4YgMohHuApnO6l9W5fVQj/k8jFL33aLFFbutYB1dq5CqHc9JmdGas
         er8gYW5B/RCjGPwPEiBGKDxfD7rtlByWU1RBA6qHhd4RsvKyzUBxJHr1a/ZCE9wl0qUv
         oJw53d/pCeDT+tzPPVIy96sd1a/LjRHkpvCeCDecUBMvK534+SkHWjNk/xcawJdDNlad
         dHpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795475971; x=1796080771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLhWqv/VagBjB5zuhR0ieKg5bnQX3hK7LoyWZzsgt5I=;
        b=YhXtktK3TaxHoEAlQRblBl5NwaiIJzMRG08xeTEasVOlhXF9VzuYseXJhgLWW2EHGt
         JukoaxQupFfWcUqLaF5oxSvwZynvmpg5wICI4n+s01aIPBDvOkU0KbknfNARAEWMBVN7
         OKYXJaegBPz6ilzvzpEe6ACY1YEwIQVhkcYg5inow+PiZfU/wA6/6QKhD3ePBVWJhPrL
         ERwCuv/jfq+xLZhDIsBTa0sAaLtawlsX3BJ5AfDooQoz4b2oyft7coosdea7B7X0T8EA
         b4VjDkmEl/GIJJrySearV1rDJhdFqmMygt7PmizPlzGdZTWHEWeZjplLfY0n2sMGlpjv
         8/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475971; x=1796080771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLhWqv/VagBjB5zuhR0ieKg5bnQX3hK7LoyWZzsgt5I=;
        b=JUs/tCc3mXC8itLGzR91PJRELfxgvTcjP7hturHeucm56Qk4EISM1BHGln+v0I2bF8
         1m9utWLgdLkRqGIhAkjWWQMn7Y9TM719cf1fA8k7AgMlJahsHZ8iW80GgvF9QcUMxW1S
         r/RkfXCcGahfdWfPTbEUZEI8N5gGcBZalBnTorjwOcTbJLQ/gInxCF2ds8iTePISpAQh
         o0bIp7WD75zSdgh1c9P93bFxvYl30UHArZDvJDhNviZEwIH3zXy3n24WTJzL/a+9a8LM
         FuskeFz0qYb56GCfl5yyfcOddE9iU958GYnwEcj7SEmwQC0NLEUQhgAH7y6+a0/xZxqX
         Ilbg==
X-Forwarded-Encrypted: i=1; AL+hErEL07nJmD0VXfUkGL/06I1+tvlBiuaYbYmPoiuw+HhhdiJNK6xIXfyj+2zbyhMeE9WtvnfJOsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+URDeZrlXglA43uqxxPlLvh0Tr2W2hFQcXJ0gARv6p88lITQmb
	X+0vyIR71v684mHhP6rncL5ox8ifbsXq1+/NeYVQRnxHxznhjcdjb2APZMxRm5M1fXcyEot8WW6
	NcoEOJtibn7izBHA/MQEp9uAQ5bsTES/A+vbm20Nv
X-Gm-Gg: AZFdTZdh4BHppalckoJrGsIGADYC0/VJXp4YJwnC08qC0QK5X0GpPxSx2GcLxmMFG5R
	HTRJnHVI3Pki1SlpPtbdWmypFHgxnCoByRPHDX3gOQOU9bF9bmwyLf0tMS58rZ1ni+dWuODCLMe
	x4Bbt/P2yTjXHZjPdUR1MYsZ/bEWMZmJO8KYBV8ToSbBEkT/JeJmD4FfSf/nsCIXZ5NIb7lhAdH
	6jAqGl/pT8gTGD69Wpi6JX/GkgssaF0deO7KU58LpRSh1/R41kA9Ku1WOq2y7W/13CewGvuViuO
	JT2kmEf/7y7crDjEYQEYjcg6qJ4skkPa1HTHtZUOTmf1DfiYehBgNSGEMDxS3ytKFQbT+XUgyri
	JjBduPu3MV0BwhmiZGz7rW57osCtuALFLHc/WTCeYA53B4SNbmTqn1f8x9YZbr+00tDnKnA==
X-Received: by 2002:a05:6a21:7111:b0:3fa:f23f:a1ef with SMTP id
 adf61e73a8af0-4014da5d430mr11922129637.61.1795475971432; Mon, 23 Nov 2026
 15:19:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-work-security-namespace_free-v2-0-65591dbba7b3@kernel.org>
 <20261029-work-security-namespace_free-v2-4-65591dbba7b3@kernel.org>
In-Reply-To: <20261029-work-security-namespace_free-v2-4-65591dbba7b3@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Nov 2026 18:19:16 -0500
X-Gm-Features: Aa3M54pQLfC4vU3-6-r9j0PdP3_OAJ4uOdt5cmk3KHNndD-uhH08FyqH6wqPWRk
Message-ID: <CAHC9VhSq+VXrs-M0ezGGW66d=-w8rjqCggpnS=ORiRZwMRPdmw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] ns: allocate the namespace id before the
 namespace_init hook
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, netdev@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:41=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> Currently the namespace id is allocated only after __ns_common_init()
> has called the namespace_init LSM hook. Most namespace types allocate it
> in ns_tree_add() right before the namespace is added to the namespace
> trees. So the namespace_init hook always sees an id of zero.
>
> The namespace id is the only identifier of a namespace that is never
> recycled. A bpf LSM wants to use it to track a namespace from
> namespace_init until namespace_free, e.g., by using it as the key into a
> map that associates data with the namespace. The inode number doesn't
> work for that as it is quickly recycled.
>
> So allocate the id in __ns_common_init() before calling the
> namespace_init hook. Every namespace then has its id by the time it is
> added to the namespace trees. The initial namespaces still get their
> fixed ids, either statically from NS_COMMON_INIT() or for init_net from
> ns_common_init(). So ns_tree_add() doesn't need to allocate an id
> anymore. Ids are still handed out in creation order so mnt_ns_loop()
> keeps working. Mount and ipc namespaces already allocated their id right
> after ns_common_init() anyway.
>
> If creating the namespace fails after the id has been allocated the id
> is simply never used.
>
> Landlock logs the namespace id when it denies the use of a namespace.
> For a denied namespace creation that used to be zero. Now it's the id
> that was allocated for the new namespace. That namespace never becomes
> visible to userspace but it's the same id that other LSMs see in
> namespace_init. Update the Landlock documentation and selftests
> accordingly. The selftests can't know the id of a namespace whose
> creation was denied so they only check that it isn't zero.
>
> While at it, drop ns_tree_gen_id() as it has no users left.
>
> Reproducer, 100 user and uts namespaces:
>
>   bpftrace -e 'fentry:bpf_lsm_namespace_init {
>       @[args.ns->ns_id ? "set" : "zero"] =3D count(); }' &
>   for i in $(seq 100); do unshare -Uu true; done
>
>   before: @[zero]: 200
>   after:  @[set]: 200
>
> Fixes: f675d2e95569 ("lsm: add LSM blob and hooks for namespaces")
> Cc: <stable@kernel.org> # mainline only
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  Documentation/admin-guide/LSM/landlock.rst |  5 +++--
>  Documentation/trace/events-landlock.rst    |  5 +++--
>  fs/namespace.c                             |  2 --
>  include/linux/ns_common.h                  | 16 +++++++++-------
>  include/linux/nstree.h                     | 18 +++---------------
>  include/trace/events/landlock.h            |  3 ++-
>  ipc/namespace.c                            |  1 -
>  kernel/nscommon.c                          |  7 +++++--
>  net/core/net_namespace.c                   |  2 +-
>  security/landlock/ns.c                     |  3 ++-
>  tools/testing/selftests/landlock/ns_test.c |  7 +++++--
>  11 files changed, 33 insertions(+), 36 deletions(-)

See my comment in patch 6/7 as it impacts this patch.

Reviewed-by: Paul Moore <paul@paul-moore.com>


--
paul-moore.com
