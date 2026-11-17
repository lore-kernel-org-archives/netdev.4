Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904006;
	b=J4Jj1Pzv0ADebLjgxDMmhDeFGOdCKFbz3DmxmaXx9ONtOd5E7mvhp/1614f1nJDHaYiR
	 pdrIXLlp07THW19ZprcdOmadhC2kALFhqURyy6Dx3cu/55gaCao9K7nEUAkfelw3HAYuQ
	 TB4zJJWbhBZNXvx6GGZUtyUL5vg8KOym4WC0mNKujdNW3zqY08+I7YmUxpklbL6pnhtpb
	 MQcTcU5/ln0asRx2cJKUCIutbUCpZQ7IcVat+Y7fGL6QQFHyVqnyl7V4urTWyJeWoZFZ6
	 XzzFVr26UoZvaxkBlxek01LlkzOVf4JCuGOK1/njeMUP+2kb7f3coTsqlGiIIqUvgCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
	b=QhkTiwfocM/sMTyoefZESIoxLj9wlKAO/EGiAWorEnXaiO94y6LotS4da5jX6SaxKFlx
	 ZEGXeeAyqtafrso5cuKBg+YyIt0yDlWe3Pm1FIbePQrLQTPqHA2HdarTV2KWs7nrNiPO3
	 wPg7O/IfEMPnjOc7DmAI0peIh1BCdu3beu2QaSL6W15i0ebLG09GOZkyq+RLq/hvCAkNS
	 UhP7JjescuTYFKtYehldJkQNNsfaB9xkXM+izrnay19SUrV+hKq7owhWGOULcRPFoArSg
	 6JQUlbL4DCMDoUDZu0sd3S5+eWn3J+DbYAAfBRuJCog5NK2V5pjiHQJ7mcWXB0tjifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA6B606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA6B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bh3COd7Z
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso174958f8f.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=Bh3COd7ZzI6TmZdb32Fg462zWvuh7WQNnrUpXucHXcpV5t+t8gMfKKxOWwhkcHBcNt
         zIJKpUT9Ten8K9xmb0ZHj3p/ljeyNVefWtOpjWCo7Igmb/P1wzmYs63YOxLg7f+WXmDC
         wf3ao9cg3f1DrvZE/oBKoQiWFPBKSPnWk+jCT2CGoQgxeoDuJREjXd8oRMM0GizRyDLq
         q7c8W4Fdq61I08pJrjWNPm+S1jXNjmZ2MpEutx4SYZ/JoE6iRzvUZ/uRuGO7TyWDBzw1
         OlncqX8aSwrA8zDhY0Cn+N6eWM3qFfFk2ULf9A0Yk8lhKFDJjJXQbcxKbI+h6RZ2p0E1
         0Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=oLyJG255tLjbwQpL+C5XHzexIyzVQltC3O87waLylQTEHDuSY+pOswZAFhvFNqqN5t
         RtLUSorgP24LpcdLw3fvXaRkOceE0eZ39zPRZei2wICDdZD4VC83NAbIABLB/Z2M3gun
         fsVEQ5zfUZIzkJtgDLh5RNENlzDdgir7VcW8Io/JIGkUP55Ut2waKigkXTilTSnVVN9m
         huq/WuKZaRdLjdemwMuFJEvCXkSQXaIpl9/VNdSBIKSedNC8eSeRWodFmkpa/ksuca0H
         yQ2mkCRTUT2mkUo+hYEeXkrcJhzaYFilg3mrJT6+VNQzs1ZWCdtNJ135QIUqkQPc876P
         L8NA==
X-Forwarded-Encrypted: i=1; AL+hErFNOs0cEyffNU4jWfLwTdHd1ZnSi5xvLvlhdhaTO7/Ran//of0oidrSBPGvUBiFWxkV032mFLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iC8SDsRJ3gekhkKp90nrDPFbsrCRuS16X2s2AcdMilzcrX6f7
	wibu0bxjrl/vHFxanXyUENRc3zm4XTSro//W5rs0FPtaS7BNeXP9Tw/bGFgtaA5URxGy
X-Gm-Gg: AZFdTZdquPu81RtMKDgCCh+II7E6xFs3VHLzMlAFxDj8iGoR3elZ6AmH+fPL2nNwqBU
	iKyYZNX9RCgJ0ekmsqE4uVrOKRIXuVdyCNqP3Zck+z2tfD821zyUXRNeGnihtxdwtUh1lr3wRJC
	VKt26yw11TH9QuCKgFnam65/Dln1GH8NBGjp6I6xu7DBY7p9yKmI2FS3nRPrkcA9xeYx+uZUQWs
	f1qVnC+e7jwC0dnqL0AMJN7wNS3e83JMx+OCRXA+ySZrA0o0NM2IceOohTxmbIPkbPonnzQklbK
	XuG/gs1kSJL6zTSa4qPNQ+tWhdVeA97WIcdl0c84gtHVndw7CcsP+X8aCAvKlKeUoU94f/8nwK9
	1wCbbqzcAi9a5YSk0xt6/U6JM9E1FP5v/R4BdCOpWgHVeJgQjnTtlm+JsKLTxEauHOFpUbiKJN+
	akT6nJW7Sbz1crg57LcHceb945zZO/Jt2ilBN0wScRYK4Swb3+4/CtTMsxCfYcEGZnGOvsRCCGE
	VersRWq0r8Gc5zsaxXiKodcl2R95xgDlgx3iwO1FhZEpAMP1/IqwZL5yry279zkcpi+kuB/OTK2
	hBYCSOhqfx0UCqXg3UJM4f0SHrsKy6Si9FwwIg3TUIKh0VuLkF+TOh907EpN0ugA88mr8Ux4ylT
	nS06MQVvb6cFTAOBoSOMpDmvBCyQR3uSPaIR/93ITAawrKd+SwzNY4UQp
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
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
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
