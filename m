Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904032;
	b=kPy6HJ37/UIjUqm06ATRR3PKGfPfcnxFJLcMBWshFBkcIWCkEvdEG1mZTV6Gah8DhwSG
	 KHziUzniP30rRMal0+e2odHiDbra7b+HAtJ4JTLhw9p45PRI2If4NTAT3vzbXlu6Zs56y
	 gOWRD876GezFar9fFi8E5vbOKjjnHFu2qIB651h3O6kINgEjH+fL2cIDJ7XBB0tnDmuqB
	 n9pNZgjugcoww+Zc6oiHUy6L6x+nU+1DGN9YgVYJJAKJUa9uQe/lGQetb3AOaXX1iCvJP
	 uynAVr8OuZH89QeKRHXLRmLp7aej2TaFF14Fn9Ak0Y+sijy17DolKVoOEPPfGUfT4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
	b=TQGw+Zzsiv0KuRaNizpp9eKTjblZ2iqG/J+Ublu6xoW7+fXfEDnWTKxBVEiG+CtCbPCR
	 RAyPt9J79WvPOwAvTK22T1KR25W4i/hz8dPwqNwekaF3LAZMXmfOqrJCYzOaFM8o7bQFh
	 8WcgVRh3SKYO5XtRfqVhZ5U32BXLBi1Dov/N4YfyTFcD0t4jhqL89HK8qA/A/nQ2V+I6f
	 Xw3eXsqT44BrJBK/I5IeilIcOBYpJPECTsQnRVNTJcrzvheOJWdLVoq7T6DgsiT01J28n
	 JAv4BcDsL6NQZ6QmB5jFJWnr+8aKuA6t9WjIbg59URdxppkPcUjs7RI10dHeGwDp90Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A5C606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A5C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so17182735e9.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=m3Y+iV2pelmutPYORVxza4CHQMpjq7iS5lmecWgDjvax6Coso4uWa+KMaCm+CB3bWY
         yM9xDjlaUDqClL2wfFs+3EgMKFX4Q8fuLgup7VSVEO3iDYFOyh4nyeN0Shri07+KD82b
         UFGbuWvBELdRnXkiKa1GIWjPRb4Wz8WRQUErt4eMboeCaxWHABbQwTZk6BuPw2NopAXW
         5935wwOL0Ggt8LD7VeJmtmL6iC6DgtiD4S4DRbEtkaj1swNFS1XEbe90cWaNyokAE8Lz
         Ulc1c4G0eNVUIpLzTdbViN3HgCOMoyHpu6hnCIZ+utcpbQY02w1kBKtCyN8iaUfGq6tI
         6sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=pGNoym3Ya52ziM5s3kHaLffDZTkVCgVQxstLJx+TBZ3XBmhEoIbbrZpQ0TVVMi6wVj
         vn1S+XhP54J5qAXiLTJndqsEp3D6Sn5280V5+TRih9Wb0SrqyTYtj7eyIL+XUKx6nH0s
         VEfnCFn9SbY2E3N8FbxUfYMLRt3lx/5+QXpNJUr4ZVkhSnBfvbjeBX5jpnXm6eIYVPPF
         upqkcX+nTWvlGEY7ba7zNWStMLqBGFmrkoRXnYtZhjDHn2nLX8XqJS4pYQZDHHeycUC9
         r0jxMS5pxWhXfLAODVY5McNCC45C4YIrIB83Una64VfhZqd3wisxemzMKJ2TtN/MI/PE
         q97g==
X-Forwarded-Encrypted: i=1; AL+hErFsOBMIlXsjNpK+V1XNw/MSiCeKpVx54EwK5pzQzsGErqlCDRj812Cn22FmAkSX08lA7hUq5oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X5b682BNIzws7NGbcQE0p2UUvTGwrvlj5UlYaHhiEZGhdj1z8
	nWqopvLTAzTUrZF6RJsmBPtmIHpY5Yt1wUX65Q0apF/2/vhN1w1pyT7GWrCOhsA4oWwB
X-Gm-Gg: AYBFou3ztZ1ZqEMyRtUPhIBPOmlxKTNNEh2qUD0hh16uOvX5hpj58X8P7/UO4XdY/rM
	honSpiBGkXE1xBG4GU+Ggve6DEcICJbo+kr/lWLNqnGDaqcu4kNFD6/gMDziVRI8SkWjk4PZB44
	T3jcxUWzNxa5ieaBGU0SMjpj/UYuoI4kQKxRC5vT/Tur/u8ME10mKT0vpdi8EiQrES6T8ux69PP
	8Q1wLK9swuIaxkZS/RgINov5w+WWRNrBLy5r2tRlSNDMUB72+01ZaCZqNB2Npr7v0y3XhzIyaaM
	gbq42P8hLUvTTdNob1MlUm5zX5eGU6pq3aUL+6oTdIYprS/DwXzJSZjVBwxeE38EjFIVl0gh9P2
	wyw0mbr5zCHIe+uNgiHXu4x+IIdKMRqSRnIUaKSFhehZKaOnJA/7UHtekNxdhEKLq1EzDv+2PRe
	/ig8QKWQgHZcVZIoAy3EinlpgI1zzVaypvK9k8g5WfR6KXO8VytuEg7gUsKk7Y8rUk0b6AG1ltE
	yJq5+oOzuUarbp1UNI1rhkHJYGVtG8pw8z1B1gxtk7N1lLX+wKNFgh3QnIa+lDHvZHxz5QiiD3V
	Bvuh8F/5fJ5CMvTEa3RWsGpQgMQIGURpD36rJJtfaOujkF2Ye3n2YiOge5uFqaZoLDMT1Osmb56
	EPNDv9oILNqDwRM/a6dmTuJisCeVNjrlHOHX3k8xY5303Hpw3AHilJIuI
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;
