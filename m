Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475979;
	b=s97l7TfAvKQdBOvXOsrzsknHU/+/U3Dw3raM7DFQMIuIZdyhrDKhorYx7Hu+jpG+1qOW
	 bKsYfcu+JtUr5wozPxGH/qBqnKAj004QUsz+yiHD/dk49WGcQblksSFJjd4qgZvKiOHwR
	 zHD0V5Vw7nMs6qPOxWhdmf0mfpPIdQ/CUZqzozlSDNJUV4AqrXK2vkcj23qKcj73n2dly
	 Ha3c+FSpja8AldQjWrpHVNFN6wPCSVACia6AzY29eHSXxCum9Ht+b0VSqGjhOur8Z4z2Z
	 HyE+zP8nAiETcslkjasRGBzWk7Qeap1DcK651VQwLvmjK0horyR+C5O/9EAwOg5Ramw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PoobtMyoDnc+gxXLqB2HvjfkYgUQiC23/ftHCG2Qu/k=;
	b=QFGbJHOKacuaLn5QxJry4asmE9LTnF4lHM4+KiLhlmZEGO5X/930J8rrEvgijFHpUSMS
	 jEjZ911naRyujUExYrfzIYLsnmCJcV9nU4hx9FjC4HUN3yFM/JHtqg15xKzuvhnEo3GuB
	 pWfhpoadLVZdYshNF2JH7ApsUVaJU7cIfYm97Pb+ZNSOxZCtWcwLVpJMq9R7TnTnRjnZM
	 CURPKeJjwcNjxYd4qbEdm6Rn478+OSMnexelafoMdTOpq1cCan9RszjzteG2N4gbbvUSb
	 orbL4qFJQ0la+23D6axtWFXoOe+vIbhoMvKD4BS3814hUvJ9QFc0XPAERXYyyN9iCXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b="RH0V0w/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E07F606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E07F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=RH0V0w/Y
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9ae391a05so25928015ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795475979; cv=none;
        d=google.com; s=arc-20260327;
        b=f+TFeAMnK12vXHWMOUC7WQMi9BCrczCmLoZIT50o5n22B3c9rsgPhtIwykzOL71K7o
         2yFfORvLmLhpz6p0OjaUUWl8462/PETMrnv0Efg6XyZ/FwhPcqJQjzCo81sfpzFHlJH+
         jJ0MwsXTcx1efg0dDjxfs0THNCfYJNSz2G0yfqnX1bxr6LO/YrBojEpH1f2Vx86N3EnK
         SaXheXvaHs7YMKOlm71clBrl90R3gW2xMHgjbliLrZTS1X0qgzP/4Wf7hpPEiGLVOfRp
         07hDrjeIos7pry7rCPDbecMdEgWTQ0seCRViim1TEHqg7nJoa4FRhRn32JHdyIKf3vqN
         /Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoobtMyoDnc+gxXLqB2HvjfkYgUQiC23/ftHCG2Qu/k=;
        fh=vA8uGcBbQYsHmaj53IDMN78JgTiZYI2W+8sCdw+4A2U=;
        b=MvCBX4haiKx0wmK3x0Px2SBQABXPfE+w47U6t3S+mbc4U0urZJarh5JvDqXQTjm4C0
         XWC9CLbWwcECRxQOQ+RFQdRcIG15yJdiQCgx3k7c9H14rnY0oqcP+wBKgrwY35u5BAP3
         fCR0ePjrxq5XAOjAGEVNyQ/G0z5vCYYO8iYqfayJZHb0NJJNwnkfhIIAGR/+LWNZYCkz
         udmRE+CmdaoHTVDHiRRWYvXtC5kzqRA/FRWJFql2/9OqGdMMoqx6o/9yMV6DnAo61ciy
         eW0WezYl46QOkQPS15xhOsVGKf7+irKhVLR59svoWo0jUwu3AL+SD9pKuoflkIi64SqY
         SE0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795475979; x=1796080779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoobtMyoDnc+gxXLqB2HvjfkYgUQiC23/ftHCG2Qu/k=;
        b=RH0V0w/Yr/Z4AMRG2tN8F5gjksBm5yKNRTXUsuF/1NCZKbxj6Px+gUwAwti0vvEIpt
         ze3b0AYAjegli3ajVz8reHPYaQTczy5D/5H8TnUyeIVMRhXGJnsSb2RnhkLCYbicZhtS
         ZETTU1BDFAWMBEqZg2gXH/dKYu5ciTgugb+pbPvjad24YoECg7uC1XTQp+k2Mtqfn/u4
         yQUYcoahFdNOsiB3bh3TXDCfyjppcwNpsbv48RHxu13sF+IUnNZLd7/GZ4I98ylOdH7Q
         mlftfwPpLhqmf1SaXDEf4Z+0c98TbjBQ/xj4UXn4EhbvPUieaPwitbh/1GX9QXJhge1z
         U98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475979; x=1796080779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoobtMyoDnc+gxXLqB2HvjfkYgUQiC23/ftHCG2Qu/k=;
        b=a7sjPtVNiM1TmlruoaMgzuzwMxIOoVVjITCKe/UnBFpGUvtOfndN3L66nITiou4CVi
         Z/6vK8bcq/70OLS6cfvhvY4DdJH4H3i7vdkoawKc4HEO4EG4CzYJFe78AQopikZ3NntU
         PKqkFy83Dn/wrRsV5YEHwFIovcEk+N5kgScYPlXJXQ2AvIO6RrcPyz3LBklK6vEHEOb2
         QVqw/GyWfEYW+xSydlsavDvg7Yehn/cQcOOfIOaTjpeuGHjWcdO/Xq2/GD3e3lz0ZwUZ
         rPvukgX4Wg4oCurfjG69bmxc2S3VdGkL8o9XUbBxKA13gP9A7IlcqX3bTBJbSSNUWnuu
         Y9Pw==
X-Forwarded-Encrypted: i=1; AL+hErHkxJyN3ndkaUiwzS5lGHMk7HaCrzNsMkkyGFLvqfERUhN7Df9aPJvt5poffj0LpV4gbSKw/Hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bomtbSbqxYxYg0Q8bWaPVPIydzHnh9+i1Iu7BNsESZDAP9Bg
	WkQ3QgPJIwpgtDbbAUoxhzvk1mEmpb4rhk95QDB3Uz6YdlCYXNwqt3CD+yvcL5Mp7RehEcLu3wy
	jgcMqqkTqjIs6e1S+vWEiam5d3QNkzxnp+kWZZZ6K
X-Gm-Gg: AZFdTZe3OYNf3Z+tIwj1aWbNuZ1VHXinzONvVBc+to9jnrdv8W5aIfnidkarXcNp3XX
	C/MRGbavKToopXQa9bXPM5ocBMi9vqVnZ5g9vkGLMxQEe93rb51+kEkTIXi+DgY2b5LiNdVw0qg
	wnrd7Cc9mjdtkqrpk/u21nTUHnTlJAzwBhggQTYk7ZpV33nI7MHFUwSvJIvVyqpSQOm4/cJn65O
	hqTEIulK9BdhUj4RNdVCh0dtx5NQup3i0pMPIzyBmTzSt37ZM2l0WdFOzK5iQBLzkidm81SR/WD
	PS0VwNoqTa9/j/tSX3h2oOOZwRVHGaDxAJePGixWeNvK2R4VsZG9QZdbjG+B1epy4Hoe0NdVFe1
	cfEVvS2eavu0Ke926FvcEaM047OW34kTw8RR3Bv6hJQDAHhKN2t9ZNrDLhZORpaQtxxZt3nlIq5
	LVVU43/PplhYbzBw==
X-Received: by 2002:a17:902:e5c5:b0:2e9:528c:b9ea with SMTP id
 d9443c01a7336-2f03f18ed69mr94092915ad.11.1795475978663; Mon, 23 Nov 2026
 15:19:38 -0800 (PST)
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
 <20261029-work-security-namespace_free-v2-6-65591dbba7b3@kernel.org>
In-Reply-To: <20261029-work-security-namespace_free-v2-6-65591dbba7b3@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Nov 2026 18:19:27 -0500
X-Gm-Features: Aa3M54p84nMzXEsFfUh5-yY_9m2RQyZXUhbb-xh5PHe7PIY590iycN_cOXWciDA
Message-ID: <CAHC9VhTXzxXECV6fwt0BaJC8jF9EBzmzoon4f7fWaJotv1PyRQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] lsm: fix the security_namespace_init() kernel-doc
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
> The kernel-doc claims that the owning user namespace is available via
> ns->ops->owner(ns). But security_namespace_init() is called from
> __ns_common_init() before the namespace has been set up. Apart from
> network namespaces the owning user namespace isn't set at that point so
> ->owner() returns NULL. And for init_net with CONFIG_NET_NS=3Dn ns->ops
> itself is NULL.
>
> What a namespace_init hook can rely on is the namespace type and, now
> that it is allocated before the hook is called, the namespace id. So
> document that instead.
>
> No functional changes.
>
> Fixes: f675d2e95569 ("lsm: add LSM blob and hooks for namespaces")
> Cc: <stable@kernel.org> # mainline only
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  security/security.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

The way this patchset is structured this probably should be folded
into patch 4/7 as it doesn't make sense by itself.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com
