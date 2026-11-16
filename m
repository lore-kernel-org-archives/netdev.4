Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859450;
	b=QnGbu49FODB1Itk17WGrg6rXAYi7KpcNK7rUIaU/l6olhOxOnhBLfzWQ0J9KBZh0s1G8
	 INzDNNCubCUM1T0ITOk8kJf2NVO9WXF44xnTU2tAn2DSIXEM8tGVIZA7k1Tt+BNXxe+SB
	 NGfShNVVcbpaVfSQvMzxakBN2w/l8I2gQVeYmXfKwfxhGJmmYry1mdkHB3PpqDgYI5U9S
	 Cyrq1ExzqJNYT8QMRBrtc0/guQF2hDTqCR+ZDZfUcatY3LDRxSwZR/iCl8bfh+ZqVpG3v
	 zAELM8qDvXqfxfDeopeJ63nXkZj9qXpF9/h/WiTvxX1k4a17rdMwcpY3cr9i66L2oEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=XYb/choDsQyvm9eMCoz0MPHSoXaIpP9QPg00IYgs0NZ5Am9U0/s8TWsN/xtpKTSf/lut
	 DnnlLFc1iJyMxiFoYFr6QZv53cX0GhVtiDDi9045ARbIACDW1acxXPEwe3hPTnHoA1doY
	 4IVq5ZcMhwPXxAT4fji/6O1JX744Hyl7E/fKngo86oef9yqHTW36sZ25EQXTTzS9Ag5rq
	 bdZey8WQOjKi/27kEpodhBtZUuUOby5z03Xap/JBizOzJgYr54Oq0LUfE+IaIghBlb5gC
	 n/ViXQtWv6l3lWV+HhXKZ16f6UiDHXTmsx8IPnFMsJDqOiu2tzK6U6y0oAuB9ICApoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1E606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F1E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so1838155f8f.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=G7UgZaAQAvlhXADBToMHDPD67HHyl83QbU4nwBoBv3GZN9qZQ15H2pK88EyRWLHYMs
         RN1vLz+JrWgW3gcyvatY5DhDSjOcADGBII7zOWjt1Pvutx4qaUhXg8SJesK+nu0i8DkV
         3Bs+3jAqvMz+w5lX9CvudsFzqqiIFw14UtNZuse8yOetaZR5vTnoF511MnH3kJLAsu8n
         VQkbazEDS+kbPDJgqhBmPz5QLEvKdsrxHwmEGgZSlMvcSCw6ixxnRVWojGXaqBQ4Xxdc
         s2CzDtpTUrrEvikprb+JOpq91KuFVffUkw1KI6/1Tx6FoklNIRB1E6xVaRJ9CJmYrDCv
         S9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=PqMm0nFvfMTPZGVz3PJpRVpNFzbkRsBDn5RFukkW1YI=;
        b=GQlZdSTnSUNFNNrMfjnC/y6KZ2X74ibE19NDNtymimpa+qnZT+f50YPp3kBzLbpV0J
         qNoIxyd+I62fr0/3OnbtTprJYeQAGxw1GA3CbtzCxL4+HuBq3n7AeUj2cERlfhdLqBqu
         lYw5L44WWk0D0jTcirf1FXs2xBeumMEN/TKyXblNnMIFuhq33i/2QxQAH99mbf7a/CQS
         rCwr2kfOwH5xEjVfDUHuQYZl3ZTBZeQ7A76i+9e0+LHKQ3Lz8XeyVkPxkw2bf81JqBfV
         tBWJiIZNNRV9BWcZ6Tgpv8CR9y/rEVKoA4mk4cWgT6WfXv4806Z3aqlmNeoI8r308YXz
         dr/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=hnqDx80H1BHGMZ+jCw863LQE2wm4hG6wTw//ziQNWkZpZIjdyNNCtFJNcbykSvuJWZ
         RrqgQGru9l+9Rlw9NCoAO7RXSeH6CHzRwb+h6TsbT77V+vTLtC7o5AslWzWJ8+7yhciq
         sbJxN7Yoz6y6VYO91QUyEDVlXVHt5e/uzOZriYhKEljZIduQH6pNfhdOY5sHlJFueOxf
         bN/uTLfuNBjnHaTZ+WukZQS/Wa30tWyiKsfqEPmOKtkcPCgN1gGIeLsa9pfco/3ZvP3P
         koo3Bb9/+esUnHdHS2hTd5qtXE/k/xctadMJUuU/zchcL0VDKvTRNofZgdIQ6mLOou9W
         X5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=oOsQe6FcrP2T9MU/gO2rggwzede8SPUg5ODW1JpmbNAAOiDaUMyh1FU7ebwFGrRA7W
         QLV4WXuUcYXwic2k/HDLhay0lwbvnmx/BKh9NAQwGcw9/7m/7fpeVjAJliF1YU0mC4Bk
         EDxRBDLbi2vf6JLisLbTIYV+T1vRTgrA4Qnmbb+X7OLRN5ypV2a7+T6MhvBKgI1RG6Yn
         uwUmTOLLZ1jnDpEpbXXKfU+lwKT5Dq2mfJRhQdBfeNEyxwoVfiyCtNwgdxkFuRr1USdj
         DOp9Nflvux5rZbUiQ5yfInWtpS+wDvH+OIRfuiGa9VRlcK4+A9aDQf3nuQzyC6u4pJBP
         914w==
X-Forwarded-Encrypted: i=1; AL+hErFCtAghtfM0pNvporU/9go2zWpXdZ6iZHmP9N8b+X3y/9luaGkqEU3GDReHYmdsukC1M5BCa80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vFmUc2RKXket4HX3WBrWO+/k0705diiSamgmBmsEwoIwu1LSd
	JtK/i1TKxaqz7yfAS30DBv+WZmwMH2EGD8EKi/FjyIKzGkLC62A3421vrliNVk/BiRql+XnN+0x
	le2PFSdTwSSivGdcxsFKvZ8bqWoThn34=
X-Gm-Gg: AZFdTZft6PiDroA9pgmzA0fH796Msh2Q3XQydE+kPef/u0F0TSc0vyRvwLNKGyZh82L
	qtBJ2doeqKaeyg+yDRGL/8s+HQUNeCZ4fPBj0hy0GWXl16MiFiVNGVI441exIQ3orXtQdFFx4HI
	DUDL6BAvAr0XmSJptF6IVjGzoYZSAQHFeXqepwX+HeyJM3M92+OPMHox2WJbsPWID+eNKgAtGnF
	ZaS3umNYh9AQyQSsKKkZ5X3btMKMqrbgyLpEmczZKW0rqQaK+XiEIVMzWK+Wb49gzAJ5iPBmrWW
	HMFZN4qGLQnqMGE67sHRBV1gTWbJFUhfzD5E76sZWNVPxCXOOLiuZLcfvqPb/SX7aGXmfbkoG7Q
	u43qaW9/pNBTLE6HSZgR/J8+NE9CAkE/kwkn8ytu13ejjn+hGpNnhy9kHl27TgdgKQ+ZMgxc6Ow
	EXCX3Lu4wG7xhCyYOkl54=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
