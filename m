Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904347;
	b=27knMDChFkMXgBvNTSCPLY7OrAnhWoqKgrKH8dtG+sMrPPeIPnSkjhfqqHDH1XCZxbf9
	 8lYZaHyq2/H060NhV5PzGOBR0F8Y5sUEKYLDwgDNvwIexjtqvB2PV0nMBUhbaM/OIQAGd
	 fi0yK3YLxkGpb3J/+WNE6LxCGRtRSs2LgrImUCewKpaYKWVZCWex0Rn2mT53S+EJtg4qP
	 3wMu8xteq0ltJAOEQCTF44I8vpq6r5pa0tE2l2UM+sNtdVScTelyL4mZfVsLy8pxqHdnt
	 0fc1loI+8/jEUJwk7F7PNLbfp70SqTjHBHHeA+hjZmHREz0wFvF8bz1ZMwP4t1NYXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=BxWDqh+WN4WSRt6P9MlZ9T9bkGCB/kCo/qXpbNZ+uTDTTr7ajNEXEK97CIXx2s1YdLS4
	 wXBfBxUwQCCpRWX57Q5I4NZsw04YS6Ym3EdVbYwbsG2tBi2YoIYRscmkH5BLDdnGzQ5Nh
	 TAJR/fedRTrZpzzkm/gJqRUQq3msQn92bpWQmc/m7EdG2tZ5SrYtj5K/J2fWeVZpx6zSm
	 Sh5/LDxuCuCGh79/U3v1o6Rk7ws8jZ25XogSkkJjpnTnGObdN9opjVChPpvgY4cMGOsE8
	 JyxoqgQ6+4M/JMe+KOluCKMcySIHVujI9UHdAjOyRZn6sKB5TNIIHLN8N0p4zbA/teQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA00F606A889
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA00F606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49412eb1474so2235568f8f.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=EFPX8Vuf7iz+NzEUQG+pPgjK/MbrESqv3n9ATmra3Zopp4tpstszPHFfE2sR6EI1XH
         /MuIqTxoWkMXSLrvcYnqUGQvNVGY6YndEf7Smwels/t/G0PiJAqa5YTB3/XSR2c5vF/4
         5S685rADCuM7kD+KTHsn5xD0Bbvj+kfNJN7h3Eeu6Tgpz77cxc6E5ixV5T0A3r/KAOuP
         +pclbSVYUTOzYQ2RRiRVVs4C5Z7y/NhXCRc6Of4Q0fL8jD/Em4FfidsaQN0h6TdkChBo
         DufH5bn8tmF4fp27j4WWCE7M7sjar8yCORXmuz1wFPQxfWworU2xHCWyEC/YN83R4E+t
         3i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=urBnkNb2UVvw3bmUiWK+5ALOJ4G8gfQZ84P3l13eHpHWnREMANDBEdSzr4obp1m00m
         fbrH4dqyh4IkTupAej23UHtoO2AoGBXmpLlZZ0yDIKzF84jt1wmqSWwB7IzBYQcEQaZF
         EEDsipG264MRwMb5X/CeRloLkhoBtd7EkFpffo5iqZpxVbZIydi7s3FKbtJLFYNDDr53
         ddjTQ6Q1xVdrwtjqL0ilHN4dfdxtk256Kn68FaAhtFf93yeJFhZ2SfjdbyBxTvr3txLz
         fFW0wxvjIlPNs9XALt/5KTAKfI9BFTMvYXnxK7xYh/HPOEIi6cFJJHR7Lw5qIxQO0/c4
         GbRQ==
X-Forwarded-Encrypted: i=1; AL+hErEP3xbzmcSw83jB84LoUoQXgGZoqI0g+8s+G+pZBt1pd2IKSdrot+BW+mSvJDnQBGfoJJheqlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z85TdOP/7gdoayDhWj0AngmheXIqmG70fA0rWwHsxJLlZ+F2ERG
	jv9rjxlUv+D5E8Op0FEcnAizSUSbpn1zcdLLEk4WEjnkTDMM8pZzX/0vATuhlrU04zzL
X-Gm-Gg: AZFdTZfN61NSVgRMB1mYPj3m8F/CXo4rLlZLj6bXk2Gvor7pWs4r65ONmtKMg5GEC7k
	8xdii8dEPjldRLi3kW3CuncWtYD7d93Y8Lid7MnRDMHxWDw2Q08QBvEar5zDMAy4Ht45z1bqFPG
	Nvitb4+ZZvdM+nd6wJWMSCI7JewGn9IX/heRfsk1Idw989dFglxJ+vTynTHZ1HNR1Sf2kyK60Xt
	NpsUZF5y/JaSJd4v1n4ym5DS8UxW68PTWnsyZDNXgOUhQM5WbseZCcnUWL0TwNYm9W84r/07WNF
	1fztumxAh5nuUGR5vszktnmKnZf4iYsGmiGK2XAPZQrociNzDIMAzBthBr2JgrqGiuTsl48hoH2
	TIW4BjCHoUAFuUVsNlDdoZ/Zz54Bnr+AovVDfiV5QL66vgYYBMiAG7Ci8iv02i+TEMw5SCwPxIH
	EEC/8rNT+O2/I0mwxzNEuLEWOnUhWBdI9zORBJumXWPx85Ax8IySsiMZnPHfHGaknDa2mK4+aMP
	4A6yesrDsmSo+sH1+Dx5n4rmuWNORDrgqmKLUHok7TmbSFGpA6ach6EoJh0F7vQiQmSUGu/UJG2
	Hh5UvVBol5bifHn5qEAWmAgMBpql5Y9vUi+M8E+QAou6leVps85gnr+ln+UAI7lSPCmlNKGGKGk
	AyngtlkCyyLcWg5O3poBc65f/zW+/qDO4FJEOuRdE3B4XbmTRNDW/zfLx
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
