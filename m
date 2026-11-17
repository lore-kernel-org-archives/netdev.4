Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904513;
	b=dEH4ZWFSLFTUDQ6C6vRNKRTLGqEwsCCLXmC6n8/LdNg4U40IgLVY/J535AB9oEJy11vB
	 PSw3U6wjissEk5XoxidPoKj2RFiWhTN9x8HxtTsNnNk1827oYzub7XKlVS4ohV7ATBQeL
	 ZyWxiUPpLipGwRd5wHv2+6PAOAGMyn3mvccSI0y7ThHXCYW0s+RuaWuWkkD5VcvLwioFf
	 3B4iEIZgsHsv6nxRDrnTgrBeE09W8FKcln1Sp98n99xXkX18tSPKScEFeWWu3slup94sJ
	 tZ3p+8UeQYxrJ7CVVbwFqQLFtoBI1nsNyyANLFEMx1N1sRPuBA9Y9ZrGkxuelSW448Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
	b=Ny6j+SwK6sBDIGMrgOaMtiY+vZ9LDrNngJFOfxNS6mt9TUwwlFvrGBkajamh+KtjGvLG
	 C8q527geqQurI4nH4s0O8KB6hWOrxEXJiwxDD7KuMh3+SycjuTT3sUMq+bgA6QvszyJ/J
	 xjJt7pOIML9l+h3u4I1HBDFkRR19km8cqhssY2xzEuzlfe6feLSvfyexFhzJ5KvCw+niu
	 PJI676NX13ajnJwUljCeuhYz5njDBrjpsyrQKMoWRTXY30jXwTqNbvEty94IGiqfTLo+P
	 zyihfcoSwoqqAdYQC9y4da92sEcEgjGAGKczXGkKIH4v9ROd0HtMiIwFYk4NN3GbTKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD1606A8A3
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BD1606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=asHWLUHh
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2440154f8f.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=asHWLUHh9Osx9c7ISjHVvBK+jrwM+bEKiKQ5ZLUG8jHeL8cbDrdmay7aq+azwtlrvN
         q7YkHw224WJQO7TnM1AyMygFYXrlY29jKpq3C9XROr0oTqsA+UK4p+WS5GMy+xx9DTRb
         nuDA+OEO8+ykjkDq/RDjAwEfWgenycj+snq2KkG6mulygb6NKchr6plM71+t8W0/+aGL
         LigMC+giRqQ92TsunABClmE52NWQSdRqhQeez7lH76lemvGh63Ic8nud3Qte/9KpQmbQ
         YrdviXjfG5hlS64KIE7Iq0kMRVYmtZMNK2hkMRb6Cz1tihRk5N+J71aJKPK+K5E0SOED
         KbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=pDQBDfu2hpg6Zr0ujQFR1P727oQm9LAumfqE/99nccDE+T/PoHMz1OxPmIlse/9PTv
         ulC9xukW4siT/09bYrGSaaSk8FzEmDXHUvi27Ln4DW02Mwafzxr3HjZXzKrUC3PqLBvW
         /Gm48PBKVcxQw72j5z65RWTyAwbkzcjZY7QUA7EIVj2De7IqGbEjV3DAA6otwrsN58MQ
         VTZLg6ad1BpfLDhrmnXHe5bFfL7K8XGuspjVWVJLHGQdzwwKJxhO+fbeR96PhI8oXdnT
         Jm+umVsrVk/p6OqJv8uVgckO//rsf1oXrS0Hpr3n2paMCcdAgp2yYCb8mjtYjvsL1Wbk
         M8bw==
X-Forwarded-Encrypted: i=1; AL+hErELznhMpMjofboWMKWCMlTWH972/iHe9ApE64v0DY9RdQCRDTkhFysPQCQvHSBdTEp7vi/URrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uX5jVE6xC+9cLJH9agwcm/LWCZlnbqwY/YrSE7IZaT3TcbRZX
	bKB6EUBt63yAvR0wcdEoirGcT0Av9VC5bha/UQB3Sf4sUUUa6VnySH+W9be0x7NtTbUs
X-Gm-Gg: AZFdTZfctf9wuXRj2pZmsGdLqJVQPxQq+NlZPbz6F3pmE3dYRgKGnRuUxT0pq0qS9oM
	ijEqMxFCeWsMc8FOBQmjgpdGElq13K5Vur7/Zb1ICP6pWr2V12z5vGgrrVtMo9ElZQMN6YdnEdc
	9u1NEIfSaLj9tznScf5hDlByyhMowCLWF/4um2YG2L9WrVo4mQ+6xT67+/hLLNkfd13/cNxl6qT
	pVDMgEywwSkiUt1wTpj9gTQONEz//2+EcSxWg4zIIoBAH7Bfq4xdD2RXdSKP+QZXAb5N5s13Mx3
	tPzHAqxySKx8pwX7MkVE8ByCppK9OWpLdJXGE+Ou+AhWyi2ik9lX9UbH+e4wUtULbU/GIxWBdOo
	ZpiRLx5YaaCYKSQJmGj66EfqC1yC/UM3O3WqMt0umt9zxP0Sozlz/s/dLjWraz6Ox6SCpmGG6Jh
	NUHukIe7/43JwWUkKDwnr8dvFxkPc8HOTC/+4ViGXTSJEN/AHb8kGTsrsEF1UlV5IUVaJ36Ntjj
	2EzJ/BhiBkoCv/Rxq4Jxx1gaH90q8qxKbbFdaOLnuvJBCxZehVLWuYIWZuvPS8Q7VtQeEok01sJ
	AlZar5DzQxQquRkPQ1FftlsIjcxHBxKuPhBhWgdsD9SGY5hD686UxqmZWXHF2rZ+QuKrgRotVfo
	BsC9oCsELTN7wjrgzB4APqAwDdXVfIECyOvxG96Ex37mxOtZY2Uy5GMQu
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
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
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
