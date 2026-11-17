Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904089;
	b=wjgXpFlqu3qrkb6nY7zPB//EWb5LDxKgKIQ7/hBZPV3lVrd0caKzOq3vnlLCCwI68KHA
	 wn6cY1ZjNLJLGR16nswhpuhyoe07FJ/uS4zFEhxbjNPhrbODjGrQGrgQa6odgrmSsSIx+
	 9wpPKiWQt3InFX+P7RHlEKDCboXhv6WdGGlwqKYZAd4dwRRniIYlZ90i05VgnFgB/P/FB
	 ZsP1VsV7FGzM1/FC7+lZ6lnonPQ4B+cYyYMrWVQqmWbpHRtTVaKnUuecc9J9DCwGGHuxW
	 hKGQXYmtcWNxpG8CngClmOqNiZ5GqzrXzxEJ+Ov/9Ob0XI6E9AvbmFWWL5UA+Thay/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=Hj4/Kq60bJBWxl8Vn1IPOvftitgGlfc37EEdKUVXXpSqD654z2L7syewugrqivXlIPdS
	 xEjGvoTZUJGhKJdnI4f0D6AdGniuq0RidhJHv/y0QlPv+BrGpD5I5EqGBLjs8EYwjCHEZ
	 fZ9vS2dDxW3VQH9Rl/hKNT0UInLZFBjjeMxwUPGJL+9X9+dpTrecBpSKeWbdNulbKAUwX
	 QEOgLpdI+HhclFOv174yFqc92qaowTjGjfqUG0ptkTwlmmUEesHjpolqxC5PDxlJ+L1Um
	 UTKNcqDdO9Q3PM2V+6FjCa0+l8rbELykhksuY3IE6J+ayrvCYirJqYTDAeEZ4WZBFAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C1606A89D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135C1606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso26232765e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=G5kPAzk6YKyHaocuCdT5IFslrUJH5/ldhNVhV6xYWUthrOIppv7Y8kBtZdevqAkpzI
         BDRFsu2jrF+YCozPia7EV1j3KLeZC6Lnc8BgBdPYFaePytvbOESC0m4eRkryqhoEbPxE
         WM5n2Fa2IGRg+WkSIkgfyoTemIrDdEbfzZV+2Eacmamzzj+t+HuCPRqV+GPswkKxuMa/
         2fm9UdrHUV6v7jtlgmqycAcrxGUcSbURHcUFMMj9LS/XjgTFJtp8hDDDARovdS596Fjm
         xwkar34XXNuYsLWY+RNo1AZ45FE/L69efZRvwjPbSAF3CGRgr3AaMHZz6Kf/cz8pCVs/
         RhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=HzD/5M7n8kFDJ6Yr/mBIqSryMKUXWzjGtqsG1aB5ftv0NfkH7K4f+ql537M3CKu1kv
         ZBsa75hUHcZutFkpByuH82X/HKA9aOg22vAD2vedCv9SF5tlDoCjalAnv1CGYiBgxzFw
         ZgHlPEusS4EcGsnJe0EX+mDKFzgCvo6D+afonR5sg7GiHa4rOiOHXQIwkyeDUZGedW9F
         6ct1A9/yZftR+7NgOHVs0npcuKE4vldLTs+RLDIQBYIJ2aroQxddnCQU4sH+vcF7ggJt
         Cv/iBnfv1sZaFovKnVF/02BERZceDjOpknooksZ6IPdcPgXG99RAUHnpJeaTzW9qMwjT
         7AXw==
X-Forwarded-Encrypted: i=1; AL+hErFrfyxr+RjMliVm0kL8HgvVzx/qm3977Hid0oiZHnAkpFQ99gDgv5SqZYO9g1HA0QD3tnGMttY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JOFXsMkQs7JJbfyXrBGjwr1m+kue012xu47WyDfKf8QSyZKGf
	2kIK5mFlI3Ablwr9pmDA8ONNv2yizdT8Ufir6MtA2GTISK5UluHTd+i1IxikDm/XrwXJ
X-Gm-Gg: AYBFou2BpYHcVCe2rysSkgMEU7pMe0vfYVQMuvWK4bFFWFCR9LGF9yerrLPk9Te320D
	TF04T+uNVjG+3UwPsYSGj+9qcRL8Vr9Kzh6AohNutrGRchCXSQZS5za62l5+0X8ys47zQtSY+WM
	RqvA0VKY8aNdKGK6UP6qbyMLI2eNLJqMm16XthwL/YfiBI76BNkoX9+l0t1CaZoZJHnKD6NtiYx
	bu3KcCYKXRGcgHmDTG1x4VGFvvvAEGieSXgTFQXzouCzt4sWTIwMpeUWMSorI12IjRb5rb/ZPMj
	0qgioLz+kmD04O6xXvOoRTnLNzqQrz/UPp7hb3O6mo+hsXHEuChQIjEYne2/Ue3nJSc84VAK9QP
	JWCZn8j03VyHAks1ZKQv2XFgMswKOqlPfTmGYO7F3iG1NdU3Q0XATsHmI4PONyYiFuxDfujx60C
	pJg8quOfjgSL2pn+Wmd/LbWAIpupisInmiwsyLw5PqKdwzkI61lvhya9nilFbMuPwxJH2HIo366
	/vuI0xzEBSwfSqMNCoviuDzR9ehYHamAhjRtyblM0PUl3f3jnZRDlazZ1Oi35GE+wG+rRb7gL6s
	ocBHk7sKKqYsKiCTCy9+IzbSPO+/U7+j5LCfTN98zFujkj+D3DP8Ewwq9H8xuktMt8sqhl9mfry
	UDhDTO9gjTppyIEt9wJ5mZgMMjPEKexAiGtnnqfyPYYTUh4ea4C0fxAds
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
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
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
