Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904595;
	b=EJfd4nwXwt2fC3YN+/E/hbLmwXzD/sV8at9HqFvn2lHrRSSDG0QGKVYXk69T10ok0y4P
	 SGjl9RjaKr1Mo6vHgJu7IdzSj8PZUuhi37qOC63qds70Q7IHnO83e3lfdSoIFlUpP3uW/
	 iE7H7M6djjRI7QyFwfgGdfLxJFnf/JWS87uTxjzDZsADYOVFaMUolLjOWJh6YGhrC3OKM
	 y8GmFvZY3wt89L5IvmZEo3GP/wkDX3F5MulPXnF/Qjk46xM7Qh8M1/fXieHJOd63YPT/p
	 +MSlYBUFBPVzIQ0GI9Eycv5eWehPw+igp3nJOdXzVNHNYrtTsaY4QcuqGWQaGqM19ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=sOT1yCLoXQrlJgtdIpimvTODb5Bsuq/DryfFEZ+88pkcLhuHFvCQEcTPZH81N1sz0FA/
	 JZ3cwXBvBGG01Ibi1C0JGzNcN2/jwTBTh0ReR87qREYzio5VVK82PXRQGnIC3ZKUwQFBT
	 otIarbYNb+21BA/wGU3f4m8ERnolkwlvJHx92gTG8jFpgxpgMP44BX22+tBm9vK4RwVam
	 kOQC2wFKv1tiHkGzDUOaPu01IhsKjX1MMuPtUTzoVG6u12l7MigwIVXQ3WnUwFH7X/U4y
	 QO2Y5xGedUAQvxVLj47Hp+haGnG44dv+8Z5lhpgD4Xb/UR6ZYd8zTBhmXiXdMfbURwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070A606A8A0
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D070A606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21992425e9.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=VB84C1shjSG034pSk2oK3egXlQwWjuu3VjrdbAKPawk/Twv4Yif6yhPlbROFWtMgPQ
         3tz2NQZOgPBk3fq0QRZC/paJXFCSb8aJt/mhh+A0iXMTZvR4a2C4xo37cxqDT+bS5wyK
         cFfqQ64HX4H+WtOYlqmaNWk53bLD4rVzH3Dam/22N7EldMgTIeT60YiznWNjIzN+eEJD
         Zc6kl9xoD3REW2KAU35dfm9/7zuNgWUL6hteTTxoqyJmYKiacM/NYuvwNSKHsMwzezat
         1L4qftGlpMPZouPAaee8sA2dATEpRVvU+RzrgkUS2mvSj/+KFRi5Npjbd19v9tUdsF88
         Zbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=VC3BHBopxrHPsX9AckbpVRfxWvzs+qM2Wy25ibWVzost2p8T1U/CnX/cCO2UuzrSUg
         4Z/BfYJvOLsg/zRKAjR+jT6sd0by9WdXiS9wh1yWuOGpsN8i36jt45iRmxuNPzeRS4EG
         JzQq8+ylIZBbjNbCXAtftkDoz7r6GPuVVFMLD/5Rqws3Vg721EGguCVmvLHYXRWO8zkJ
         i9DtKCcxHvcWL1quIiSvjN9KvbKRajKmBgpuKr3ikKkAPQ0ONXyReCHDnnI4M7JQQEwt
         vq3zCHRVVZm15+BsIz8r3CZqGQ2fwVg1Q7xMji4qDYgTIZZU6JymNrVzFocR2GEBrQcn
         z9pw==
X-Forwarded-Encrypted: i=1; AL+hErE9kAerSjiaugsxUpoS4/715cWB3K2e6NWZtEAuIS1cVNI1XkcwUkWJRocLKbOZZDkBe4TKltY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mpx/PlYPWGEIHexFLn5Jpbmh4tjML9gLG97N0RCoSUGHz9gTO
	ofbsVnQ8R8OI14Fwk/nWL5dvpdJ+z7YjJuSO/8RrY0iBi1DlCQIDu34tgBCa/oYEyuXD
X-Gm-Gg: AYBFou2mlAc+LmfTZHVFXFc8oh1zdLliLtA8Hg9z2aVf7MkHO5WXM94c27e3bNyyXIZ
	dp6CnvNpkIK9fu8E9SkyryU0htYNF0HQU1F4lq/cL2gIWFY5nkYHN9xs/Iv3h5yhvC/BY/3Lppp
	oTXHbrUCIc0j4kv/pF8YU5+jZrWS9+vP8Y8ZdOB8Keho717K1KPqPD/gvLyrR7KRW3hIWg8JluD
	y4cj4OtfUtGrfZmE2q4LWuxidzMw0MexkL6Sv+R4yiUVynHReSk7NM2Zk+X10W4+kBfDp0oe3pN
	vusZdgwYrpPi1/QWjkGzjmg/1jx9062nWlzYj4t7pql9Df2vYjFDifv/LMMBO2oszolJnB4Yahf
	BOv0v2TGQSWuQmZ7Mvda27DI0LzyIEAQyWInIG0+OZTlNfuFooX4nyUItzfIMGnFcJiIw6sOaHv
	T6YGoV42prZZ5MowUYU/BvONaL0Fok20cNv12+MugnajMg085s4nxZV013tsjsDfJTHWKbahjbE
	f9DzaMTz+xjju6XWr8p76DLwWTiZHlmO2pq/eOgI0+D/mC5vGxwOw/Vov3y9qxCxe27GplHK+Fu
	LKLk396wPAv8kthUMAZY8OG5mdkPaDFt+CQLZeXkONM7EsVR9LaR0pgk5s/elSSuH5WXK54JG1Y
	Jb1+1wvMlzHkuGacE3hMZpZ50BvDOHDJbQxGAFm7oVEpd76QOpk13RIUo
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
