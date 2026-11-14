Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794698411;
	b=Dz0z17Hrop60Y22+YckfnAXJcXQuKH51PvcMlVIVfhTN7uHFlitFMagJDGD3lI4N4MqL
	 FKmvqRpfUpwB9s6tf7/d+i+bGDgXbTJUdxdzsCoWsXTtgET5RzdJERzbBM0frZrG/PUw+
	 fsae8LUz/u2PMYRiJXEgq4q4ScjrFvL3w/JI9t3jXCr1XBqOW2u+rEJFpOsZAjyATjjSi
	 a0KwptW5eOPKhKyZLJitgAipc53TOXqe/gKyrqTKSm1Ci0goH/z3B/HiwEauezmsIXtcc
	 KTc3eJmq+cAIuxEl2ABN++x4dazwSTQocLPZJOsD5+C4JK7aMRxw/F9Ozg1/3lLwzQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=w2vbfX02+bUNdJT6x3pOfinHgc44ymlwMoZeiHeXdkJXTVwzU/gWuydJhykTVgC/LJLC
	 I9r5Js9yH48xmjyNyxgjyea6qL5HXUVi51vtYLstJCiXRLbkZGqR0SPzyPizqcOjYN8do
	 38WKc4VoySSplo49TZbD08qvvR+asUr+Yp3ujtMwgEzOxbwGMREHZUzLeljpk4g3CA+ni
	 hqemFFwgEGW3x6CksAdMhXWCmipeVrK7DU1f8EG1L24m3w63XY4agrCBnAfbRg9S409eV
	 sAlXI/rdgO/IGSZCBCpOwpS2vAh95Hr+LZVQIEargXpuvBWw7ZTPrUIm5GaBhWKzuxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6;
	arc=fail smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1C606A33E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B1C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4611874a12.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=r2eV5inwCg0veWnD69iW+LW68yTRlyVAGiYrTunwUdNRF4h2Mukjy/fa6NP35EhKAo
         PElMpC1F8mPFCDCU1cRkRlwfsqUDC3GtSgR+QFAnklStgymSUkKC0Yxx13fSp2H65WCq
         vM24AAwNu2bcbt+NqIt6wuiFZj00UTnrzNPYj9Y8HYSypZJ+bdqkIjFop2b1U1oLL0m6
         6g6VbKjzySqjO+fSBZXJj5HYEdsRzFLApdklLq9kMTDuA5HNkHXISrKpo19tlwGoMpRz
         DATTnBFr+htCRkv1vTxP0I6LGsoN8H8hLPr42bUz/TlwbDCD0AJVc2Dakq6Ez2xrOlJp
         VbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=YKKdqJGh4vw/IGO74GhAK5S7fPVFKzOHpCnbzKCn+7s=;
        b=F69tXOaHQv1OjkRPoJDhGLhxIQB5UtFwLrxRbirGPaZTcB15P/9GS8SNs2bppt6Cxt
         1ERMpA4peHjFp4eW0+xV+C+r2WLieTB4a7Ip8n5hg+rSz8dw60Q1zbbTL7pSLYXE2X+F
         KwH4h5Sy0cIhZ/dxUguZ0D1xrx4aiwB8hlKgrSCC6uZSsyxL6RufdARpvfw4/z7wzmii
         Cn6kvjqScj0nwG0fOYOQSnTeaF63S2j3OnyLKeNEiSQGrLmrdgXyualm3UF7BNnf+b3F
         HDQgaycCzBa6z8i1X31S/DGyDYXnbb2zhcrA46panJue4roN8LWFhHocyhWifHCL8obe
         e+QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=bZ4A5V+6Vs4HKIPLNbCXlaoHg6GUiZAgPE1CoHup/u8F9XnmCFMSb6naMqQFAl++mw
         +LZR0jt78s/FhrwMU+95xN0Ho10rZ/g9p6M/dfGpr9SfvlaOXM2WfiTCtO0CejnyefhK
         5gg17lDjyCI6S+pTTK/DIWzHtcTY1JHkLI4t/I/Teu6/Lgz9A0oKfkx231Ay53Fdu4Kp
         zCo0ecwmPzO3ZOIddRCFMjOjLH94BU3oXsC8cOhJgJSeLFwZkZlFyxo1cq6JVw7hHb6A
         21NW8PziNlBat7d4DfM9UgO0YIScpglsDnmQoGQNIOQhlOx3hw76q6t8+8jTPfBn24eS
         FVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=EK8prNYU5MWi8UxVKFgH5vlCJwJ88X+NhqanPb79JgZp24bZp6zubVXILfHvpNm7t7
         9Nf+oQcIjTjmc+ERCNk/o19MUivwL30Bx9Ehu+DgaovFe8pHFasR6/AAmcbPVgWoatCr
         VNysbw6XODNNBoAwKBoAzNFVt8Xnf7FLZMww4rXIXSWf5kZHXtb2jwSt/fafl7twgHiB
         ON6jb4EU/b/RA4h3XGudJs/UQVii0DTur0q8et6RmYB1o3dzNQJ7hXBAgXEm3fKGa6ra
         R4s+HvS1198wNVqHyP7y1vHhT7Ev5iFMD0uCdrWxCyeUozcy0Mv3Ub4J04zMy7NpHpwo
         T0nw==
X-Forwarded-Encrypted: i=1; AL+hErGoKApaEkd9GinXmDUOSWdOX1OA2KoAKc0UFJYZKWx+9cBiEfeeNaFppM/C+fj/APIi86d3oEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iJt5YK4Swnek4oHZ82H/pBxVtLS8N+bwe0H0WwPK9437sm2ao
	EQZE9ZZbkLq2b7vsyOq8azvkggIGhGa7afvdP/eCKInKx6eb4B3qtpaALoKVJ1NJY2JashMgzom
	FsusSvSfcy81c5TGLftrBEJoesa79/Ow=
X-Gm-Gg: AYBFou324f/WtpHHUQjGVpP/QUXfjyntPw5cJLJf/YGLNARqjcFDBTLkk8f+UO2uxuG
	cYODi4l5rwc8BhNEU1Gx/meNHV8VSpQiBO8VlZAdC1i8W6M6eYIS01jVSFvTGngL3XeanxuGOqE
	QK6d/YTLK+YPEKf2RpmhxpJ6tl98mICTIKySqnBrGQ1qtKeLFV2ZrSh6bZqy5c6jPF9MP+9RKea
	yvXT3/t+VMzOCI+kwQwbXdZkTjjGdytSqAah4BH7oTayo4RZbcBB3HMvH9YW55lQHtmiyutO/qk
	eePJbY1unqtm0nZvFsood7RUtq7K23fvp31kEDU97RQmxTUN5bL2ftEV5+DFQf9QFE79mht9fsW
	GqSu6v/YaVQLCQdscrJpYohtVMSNqwqM/i7ywhPUdh2gJS6qdwFDqHjlVlG7ipt8ipRlxlQ==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
