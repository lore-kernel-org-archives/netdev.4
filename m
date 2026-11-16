Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850653;
	b=CUO0ka8j4Hyil69c0NLWDID4vCEnT/HzoJf0168LvGQJu94UZURG0ylUSzukMlP/s5vi
	 TKSJ6LfrYPQDyvKqoiU6jmEWZeoSHSzXCW6QzEgGcyPiRbNPE7mNPkjbZg43qYc3qSMbQ
	 6sXt+U1940TI+0qqCR7XVyAmdWu3bTlXfp+gOlwvC74unTlCQZwnZNSd/qppJN5ER9nhJ
	 TBIweRCCrtUyTsZcx1eEmyf2CNF2RL2AJbHRvsgPHF0iH0x54jgQuteLMMBxGv60iOm/K
	 1EzsWAh6brGpzvAqMWoGmw4OHTOAGI914PEAvwrEPNnzu390th1nX4j+95ejgFZNhpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=RQ79RPZ0ilDtWvSZUTpq8q1+Zr08jUx/dFLjXCjEMDc3vCuppZeR7wGbg9o1VQDAQJtz
	 +PaD8Umc0ujrdOivnmeSN5Y0tXcAic51n23Fr3slS1vaYxQKTejtW5ry5Aak6OoJnCAM4
	 FfxgFf038GzPeSFDkoDoWq5KOZfgoSsM00CbeyWMCvseDr8fkyREKJFfoORld6B13u7Km
	 GbRCZOfTM8HMpr9saYte0Etqv33Fj1qUOWHCBB0Jfm1z5HRabnFfSoPHfTenNYyzLQ8Uo
	 y1m/f7lBbJJzS0ZuZwIGTqDix4b1xhG5OHcOjdz2xy/8VGo03TSeN1cZDgD6hmBT46g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D1606A887
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408D1606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso151579a12.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=rX66Kk2u38FfcQ+tH9X8APwHd1NJLM5WKLU49HmCuZlVJ3589Abut2NSCc80kI79mQ
         HNOtm4XWhtZ6AYle41PdNQ/RMhLjH/ZV2rxOTY7fo/yzK0T+Gj2JYtY0y7lO+WufeXmY
         343n4e+zQvdI5JpX07Y6i50smpTBJpAbRD+qJxK447zmPLw6QcoYrIayPz3pl/8iy0WX
         Qvi0ikyG1iR4HvSdE04iSJ4IwNfvibaPC9j/w8lt4pBrXdU13pPiWcuJ0JtKe/KLMBsu
         /kcu703EobAH4Sm2ygnHbC7hif9cb4lHq1TdkBRpUm6cWcC1hRLlERpUNs0VrzgxNNep
         8XIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=bSMiBKI44aEe2Ed8tpd6kaYH6huAsK3ppUPoY0cE6RU=;
        b=jd5aEwpbsCaXF4iwIqYadm0sRXevgck/k6XPyHus99SuRL2KYApPWWO9EfINVtwIAM
         FcDx4/Abdc9Hco5TBop3wukVJIjnMgPYhCyX562S2GjBz4xQ1PM4Xk6FJv6d9MdaoLg1
         RUDfqCFvM/67jKlbI+rkzFauG8U0pKlXCHxntnhS7eNUbDXikQEqzHhIbZtBTjsN6qeY
         niXj83Wtv8LWV4l1jmOAdaeDW1l75orqwpYwyB7/54YTJej8i+spIsqkvTuFa4rjStb9
         qo63bBci4rQkAFX20G4OhHWTrBxuzczk9MwDgZUhzNsRf72R5XG7MqpFwpe47cLpw0IK
         xi4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=Wda5m4T+Og74YNLartpajMnAcctT7hnb5haqi9hjLlBRa67TYcEPjf80gw45qsgIx7
         FMobW/aC2ZXQsUmoaLilVLeaESS9ODytholTX6ZkGdI39Z50BqAMQuVm0upEGdU/eTIl
         KzXBiwaEJY7eqa6p49n+ZePGE0YUDeVtz78JPQJb7w7ae3zRsyAfYOAEtJq8eS6befDe
         ANfoXo4rOnrr9cTK5CEQbvEa19yD1CMimOfBL7pxwr0U+pGpN6RB970vgsC2xV+kB6BG
         DqloDFELm5xz1LM2zdKvbUwHIwogDmvmrNVDo81Was00uh+K9TR8cjrFQWZvFUjBWrt9
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=hq7l++amT1WwJgc6DKt12fY33T+p4nMGo980TvHjvDLJKLKABOESQ7v1LBzce3hdyf
         mG0qcnkpK9ZQnPjeYFXxUzVBnAV0XdWM5AOlWYUL3i3PQtteH5L8bJfMt/N9e5eJ5IDg
         zj37QZ7mzNbfcnjCrY9Q6UyvDO3csCZd2p9Ob9XgIPxWDUYcNwNLpesKW5/uMPJXE+Y0
         +P0jSHdBYacbdopb/MXvql0JjwofKA0xn906TvzqcTUh6OV7AwIN1NxoW3JdGhIT+pRS
         EoijYFVoPDig1gakyT0tDapnqeXTCmD6CHnCJy/I74J6j19L50dUq9wghow1oUpst8Cm
         5mog==
X-Forwarded-Encrypted: i=1; AL+hErEDz8Pc9u0M40oq/h3tByQu/STdaRTCimQqu34zGx941YlZ8Uy8peBPlw0eiDwpju5aQPqZ9qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CFWs5NlA7S1siIdiR1LJmNwa60g1UBtcVKGNa2T2ECCk8mH0g
	UbvqLZaGkl5FoNx4mlCb2QjCwnU/0kmophrolTWgKnCcsRqeR+xxuoJ1zkXg+SfLS6ZpztKZXJ0
	l8LZW7CoACwGFLRrqNKf1Z3j+kVwxxO0=
X-Gm-Gg: AYBFou0hEpGJt0FOulyrsQiWTBSZCaqdkxfwxadua+PzgVsceWI/IL800xW5ymW+ubr
	T+uQxkZ4JAZRWoq5w6JNNRVQfBEnTxWBwu2PbgQs4SYyMfn0H+AkHbEmKpJ6D4pVXUrbpW4HFo+
	KZg4q4KD0VFdU3uCsK5BymiMZUWisM870JeJ2fdXcGCbgGn3odd/mLzrKQ1rXmwc0uEwQBsK4Ex
	ttIKe/rky1DVpT4iV6pDwCxmQ72JVD7JYYE0uLtcCGCNYgmfCocLRR+7XQ9odAAdbXP8sAG+vz1
	Q0q5yTFgvWm/dH6RX5e3bOT6bk01/0WKgBaxXlW4JwheN3OVsDIjMLdNszxt1k6gD9huiOCmEso
	4yjesDYH9qb7J8x17ACu90dWpk8Pm3c+3eS/62TzBmyTLAd77qIJVUWA09JrlqFCgJ5HKyg==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
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
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.
