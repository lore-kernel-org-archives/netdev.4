Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475863;
	b=0PJvR12P2rqgE7CdbT9PMplDNX87Hb+HGf98pzC4iTLnONs2kt5UnA3a+rrF7sgo9mNe
	 Kb7k7v8IktQSqa3UhvISmnTQ6khkfmkXcg2RI47ftNQD73m9xGTL3ZgzAchgqAN2Rtly8
	 sxqdZ9fHdpF1X5bB0J/+dPzLqzJcicICtMY9r+I0oXlNjoRz8UldZPHe89LGxaREOASSQ
	 DOQSH7DpdM9y7MDXOTZ4oxGn5YK5cKqCZvil4D+pv2ZZldEX2SGBmbBAthCDh261GKAzv
	 kpDHOmrQcjtxty2apfx2K3zPjlApwG3xuDNljos6Olrt1vHmaF9uGXtCz3mRc89gU8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+MXRXuLPInN3MQrHXJcGu5dPrrdPX+141SdN1gzh0GU=;
	b=jLC2MHU7FYE3+fe4AtXp0gadGnP2hdQCfWHqp3XZ1RrzQSKQTxkaL8rqF/g3COcIBksA
	 SanA66+BM61uIG7itnvMWBpU7a7fX1soiG2LPFcnaiPtobb1LgPqMkVfRZoCtVjoRFEKF
	 kt6x5Yx2bmMp8SSbQqC69j0bC/EQtmvnisyjTBbKhEf6DmRQGlGu8c2SAVZidW8EJLfhB
	 JvNeK4O7vt49CfuguJMcJkuHjiQh34yR8MxIArUXdopqUsGMT5VmD2/icERhh5uR7S+sI
	 U+kTCjtPo2KCfALUesXU3XNW+iiVvYQSVf47IVZ0J1MdS/IrzdMR5TxT2XkCBKNK0gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=f2URxq+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE0606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=f2URxq+P
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so1849168a91.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795475863; cv=none;
        d=google.com; s=arc-20260327;
        b=MXpL7w3epLtmcQ0A0L8pXSiVohUSPTv/fi4bo+91GBBDATvbbIsZeUnnLTvwgTZagg
         RoRi9XT1uqQo8LLCLHMgm01083XD7h2zzgJ4gtGyw9+aK/UAaGHL9SICobSIGsddD8Dr
         mSKh3AlrQJZL9OI0K0Xy+AchP81+eJ0ojJK7uA8gLOlWuTaUXLce2ZuR19iOraDzm+RX
         8xAoJzy5cdqNB/obsaxAleWnLY3qbjQgmu9wHYcS0FNgpnQ3hSBoId/l3gq50ypM2NZo
         U4UC78SEasN442FBVeYJ734Ca/GqbXEgP89VinBIwMz8CMByc+jYVBvXXggghGiZbt8v
         mUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+MXRXuLPInN3MQrHXJcGu5dPrrdPX+141SdN1gzh0GU=;
        fh=a4da3AohfHzrff0mFBj+HTmRCc3e0vLwaDU4f0fe0To=;
        b=W+6N4XdOLKel4YIwUDEDeJcDkPZFTHkZimCEBsA3Cv+fbkvZyTtTFkSXfSx5QN8CXQ
         u/mb3ChfYv+R7UrPzcW9QzUMs+wTDrnkzK7+gv29hlZZea34wJPhyReoBcMTH0pueYN0
         pO3/bjP4/xuMaPV9L6DnDm7+aHWNbce29xkuJP5FY6TvBXTTI5AXpogw19krPlZrBmV1
         n3RwozNnWm80ImOFpzQBO9le448juyGCgfDGnysepJLLrY01NPJo/X4gx1nnclp+/jtX
         ndI0q/VmMh1QnLG8PCTdFtoSrD3o/LeK7Znphm9w6WNplWRyYcvqfZfxf4lqnrrRi/ZO
         jueQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795475863; x=1796080663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MXRXuLPInN3MQrHXJcGu5dPrrdPX+141SdN1gzh0GU=;
        b=f2URxq+PdSANt2DyfE/LnSY1XFoTYnOosj5xEXQkbA7SxI6W4QwU0HmSJshejcTWky
         S0FQGoGeqWv/V4cetnAuhQG9AIsuiihN0orRNBCn6WjeSaid26HA+lT6VUTjWcBQSD62
         qbB1PFXofdfinS7Mln/088yRU9CiCBNNcCiudlFZlzwG2Ibxhw2O3aFEMNMwREoEyrb7
         CsDxG2c54h+p3PHCJY7OlHB3qiqGkyYxICHT/g7CCS/5/T31+MIRFHRPhTmhfz3hmzG1
         Fon7afxI8wozcjBzuTy7rCmabVdtDYIth244kS2420jGicRJ8THCQhWgSfEHI5cYMGye
         12ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475863; x=1796080663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MXRXuLPInN3MQrHXJcGu5dPrrdPX+141SdN1gzh0GU=;
        b=CxvFuqtSHg2UTlxVR2J+fq2k3Sm9JVrOcQX9huA9eV5dtfeoBp/MvmfH7BP7u6HnNB
         aPF7ceS6IBNx8kDBX5TSla2ky/J0iO4XwFO0/mHeZjp2Scvu+cGGNqfhZyEZRyjyfysP
         aHswbkaBlOGX821ITY333q7REX+nouyZAyBYb2NeLJbzFXOcq4Yqd8pLWjMSwmp/y0k5
         VwHcCPXBdMv/ttvMowbgQFGKpTTsmQa2EKQMBKp3QedADgZiOQa8cQeIB3qfcf1gR+Aw
         bNeOs212Yv/mfms5H4fVIOpDZmdhMgQWVCh4P1mOPZ+WLwEFdRam7aB0mjti5lEL5HHJ
         meKw==
X-Forwarded-Encrypted: i=1; AL+hErFwY2xqUd8ttzHyAr7M1cs5RtHtXUyiwvj5DRQmeHQwn+j+bcxGupauCgehqjKYaI6L2d/Qzqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QNVdw62sbdnxdVWnLntgImnuNclSBG9LtiGD7IMCoRdUsLXUY
	CtTG9jjNicMZihFxDuMBxPyT0cVyghG1U/DcxyJVWoBsYMdNcUzuj49SK0zi/weYGdzpa6UfuGl
	ZciMGKhDJjlcUmqdj4iLVlv8VxJOtkk/BGsRZ3lYA
X-Gm-Gg: AZFdTZeBd0H1vEVLUjDmaev12f91PJVRnw3eg3VOqcoVIj0ITyTepBQDCpMqskB0Q5m
	Fkj/yAR9aDVY8saskicAs5tURGYdA8KmWjgixp2W6+CLOOlDNwGlZOietyjPfapL+1sbJRAIBdd
	8FS14qW2DbeA5KZE480FViefXZLl+VZT7LbAPo6UQQddVqnnnBWZcoX+KPxr8OSNdeyvV3hwR0u
	59IecvmnZsjIl80E3kPuW/ER7qrKsQkj404fEkkkJyPGCVSrssBgeOXCm7TxbYQ3fijwW3tMOpc
	+kBQu59xAJmGqTeWprASXGQ/qFsEYif0qZytYAXQolV7tIX7t6DdZx7SkgJhcEoNJLejbzsbV/+
	7to7EWZM7OmdIVHVw9YEamPotw9lZYew2Zvue28XuAtJCtf9FYIMPq8mGgk3z5LnwKNovDg==
X-Received: by 2002:a17:90b:380f:b0:3ad:1da4:2ddf with SMTP id
 98e67ed59e1d1-3b41cb0cae0mr10882903a91.51.1795475862780; Mon, 23 Nov 2026
 15:17:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-work-security-namespace_free-v2-1-65591dbba7b3@kernel.org>
 <20a5e5372530caa583c57003dfcd009d@paul-moore.com>
In-Reply-To: <20a5e5372530caa583c57003dfcd009d@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Nov 2026 18:17:31 -0500
X-Gm-Features: Aa3M54o74z8pn5Pvit6S16im7-Wxu2Y0a6J5-TPpee1sYBnPKi6ZczEefWRjtvE
Message-ID: <CAHC9VhT78Ktssi1gLWTKPC6KEgg9npeTf+2-vjwANeAbPoSC5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] lsm: always call the namespace_free hook
To: Christian Brauner <brauner@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, netdev@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:12=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Oct 29, 2026 sashiko-bot@kernel.org wrote:
> >
> > security_namespace_free() returns early if ns->ns_security is NULL and
> > skips the namespace_free hook. But ns->ns_security is only allocated if
> > an LSM requests a namespace blob via lbs_ns and currently no LSM does.
> > So the namespace_free hook is never called at all.
> >
> > Landlock only uses namespace_init and namespace_install so it doesn't
> > care. But the bpf LSM attaches to every hook and a program attached to
> > namespace_free never runs. We want to use it in systemd-nsresourced to
> > get notified when a user namespace goes away. Right now it has to kprob=
e
> > retire_userns_sysctls() for that.
> >
> > Note that a bpf program can't work around this. The size of the
> > namespace blob is fixed at boot and the bpf LSM doesn't request one.
> > And security_namespace_init() allocates the blob before the
> > namespace_init hooks are called anyway.
> >
> > The check isn't needed. __ns_common_free() is only ever called after
> > __ns_common_init() succeeded and security_namespace_init() only calls
> > security_namespace_free() after the blob has been allocated. So if an
> > LSM requests a namespace blob it is always there when the hook runs.
> > Call the hook unconditionally like security_sb_free(),
> > security_file_free() and security_bpf_map_free() do.
> >
> > The bpf LSM attaches programs to its bpf_lsm_*() stubs so fentry on the
> > stubs shows what a bpf LSM program sees. Booted with lsm.debug, which
> > prints "LSM: blob(ns) size 0", and created 100 user and uts namespaces:
> >
> >   bpftrace -e 'fentry:bpf_lsm_namespace_init { @init =3D count(); }
> >                fentry:bpf_lsm_namespace_free { @free =3D count(); }' &
> >   for i in $(seq 100); do unshare -Uu true; done
> >
> >   before: @init: 200 @free: 0
> >   after:  @init: 200 @free: 200
> >
> > Fixes: f675d2e95569 ("lsm: add LSM blob and hooks for namespaces")
> > Cc: stable@kernel.org # mainline only
> > Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> > ---
> >  security/security.c | 3 ---
> >  1 file changed, 3 deletions(-)
>
> I just merged this into the lsm/topic-7.5-02-lsm_ns_free_change branch
> with a corrected subject line (namespace_free is the callback to
> security_namespace_free()) and the stable tag removed; both changes are
> annotated in the metadata section.  I'll be pushing that branch up to
> kernel.org shortly.

[Side note: my apologies, my script got confused by the sashiko review
and only replied to sashiko and the LSM list; adding back the original
To/CC list]

--=20
paul-moore.com
