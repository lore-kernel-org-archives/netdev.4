Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795038587;
	b=PKP0NCx8lp4UgvCwVlpnF+rJXqjBYaqwtKr8QBYYP7kYr/xkL9KrLpl31jT7kE28NCAZ
	 MOfz2Kpfq2XLQmes6wl/fynTaH4Io5ADBSPm4TrSenSZLm8zZEgeNl8iml2GkcbeKwn4A
	 4WFi3YqCYj+rva/TUMzRXfD1kFcf4ee/DN9ae0Yedvjb2P7G298hJkLIKECnKZbQFge3O
	 sg+GlVgpdhWUqiIUYDnzyXPXi+ErAxNKZY+jTm6pvyE84PfycQs+k8Aof63LbnjDPQwzg
	 fob+o5SGUOIFHjTm1RvFMa+Y0hiGZhqRzvapwJgSzDB+klJxZTpn4mjukoVShoDKEjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
	b=KU8vuykaoxwci8p7v4Jq7Wjwk21HVIEhhrV5+zzQOXE5fcC8e9ree+r+zLdrZpgGn9Wk
	 +4UyUohgjjNpg8/QQDA0XIN/FGsOt3iokqAE+MLBEfiQMzj6HvziOgwuxqDVOAu/BnZik
	 GnyzEhLul0RGq5+jmzt01GrrR3c6Jhx0mlYdBnkDS6vRNroNRrve4D8qtt1W2ZmKLQGg1
	 eUj+8R4AZCSh4xnprJM3UjqW9/svOdkumxqrYV/Zqd4W3ph4RJUBG/pXPpK9CusCMU2X5
	 tPcx0rNIRUstsLFnlh7F6SkeyeT+7MPf/lZx2M1Iwj1RukRYLsG8bjf5anzeOWMuTGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676E606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9676E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so286218e87.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038585; cv=none;
        d=google.com; s=arc-20260327;
        b=mgS3BsbYQhEFomujJi+4J3vfdM1Vuk42+IO4mspk65ZtCmxuCiWzZVZatwayvEF1dZ
         eLX1oXuHv+jTicFhxuReBlH3hDXlB574/BDR05G2Njjb5Z8EMN9lOH66cK59045uTg9E
         /jPibfBRw9vD8CXw/qMms7g3FbyytFtM0m6LLyEUq5tT9CghO5/IAj1GC6h9kyjCMPLj
         wSMrTKI+5BJA0BwS6RqbW+TdrmjELqtqA7txcOSn0IJQFK4vI6/AOuhFbVO2WtXJFW0/
         0EUFvjerLh92mrFrLNgoeYu4O5+PTyBmYdMl44+75/0pVFA/fF09ecIlXjNj2cIijTYV
         N9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        fh=6/t9IS+CQT8rXiH+/fVNym3CgazDMHJYDJNWrn64y68=;
        b=dseCYEkb3V5/87jvlw2YLYPOlTdz4Xb1dwnrLpXdzKGpy0vP87RXgfsLYkhwKxYKRu
         A+vYuPWXr+h4Ruc+tKWz/nqyybN3vKFST+Ojc8HwNhikOhhQctoShH8NS6MgzWMRJ0/U
         khVXfb+/9lOTgfOxTBKF8R5h7NzgkJCavlXmRdZkuUcTBdQOgVgBdwoaaS/L4oCdAodE
         UIQeTuv1DrCz62nrzgr3GDx4At/Crzy2wog1GpGmzFNY0OfpaB+PiuoBkrA5s7IozFyP
         ng1w//kOHYjdxnjL7wDBScUM6g+qfFNMrMNlTNZ4tZcXkAIqLNArGwRs+DsjUqqvP5cA
         Baew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795038585; x=1795643385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=KaciEEIFbL/YwiIDScNJOJE/ZISkK9Hm5quErzyii+lNT1WfC7kXZg/3FpRZhArF36
         Ad6xuGX4OWHMMcj6Uv+Z0P3xjYKr4xdoCcBZYBSZ40V+hyh+sFba/6f/Byhy6/IHBYV0
         /krtJ2/zrzEeNc29BPoEzTEoutLnweqJEraHWGz4Xdqq1myp231uUNQJfdNikDffJxU0
         OhrtcSpB956rNGC7WaELPyoRadGtF0ROnUwsxD71d4jKhm42p47rbfwAaCyy31Ekzp8c
         eLl8tZDuFmJ51rjZGikkRD11SztUd+7xg3bdsx6y/sDvmlwM86hcs70DaEGgQFzFJe8W
         wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038585; x=1795643385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=Kuk0nj9fmew8LNKzrLoxmC3L1n2ufQPhtAKMCyh45UgXtvzZlYpZrD0LwrAVklFJD2
         bB5WWIdLPvw4p7dANFL1NzifeUpdX63BInl72tS245G7Spw0hv2Oz8VESq5QFjJhgqSe
         uRmMUCUUMr4CuX+KCbOy8ouPsxJW4dfYNYxeV0RaiHVk9Mq6PgzANsAUnXLbvLXaue3n
         QwftAvmNfxxt3m96D82CyJS/mybZG55zkflmvdNKWQtvgiL/IbWHOZrKbDciV6+RIk03
         PEVRP6sbnu3F++CwYZxs3tw82bdxtSjHXikQu51JtcGwyzEEt/3li4XtugG5lID/NEPH
         erFA==
X-Forwarded-Encrypted: i=1; AL+hErGxpXw3sAo/ALHC62Drujm3qhNaot5PkhCFNvBkA59+CVA7MlOG/BzQt7aaUn0dUwnIR8n40tE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gQT1sswRJRTpGthckVZ2gOLaBwhOgEhc+71Abyy50HUk9cuFy
	/VR6I4zTSDsOKKAqiZjwQYrjWDv3XeLymEX0ia7ZYuDqjP54+gCsgajXjYCUUh1sWa3gAN1afsy
	XjPzmv0+CZ8pC7FCKOtna6CaWa0oWd4mG4DsGzBua
X-Gm-Gg: AYBFou2HczrBj3NZzWKcO9I/VfgLbFs3v9qZTmj424+5QT1RAg6IWyObKH8qiW0a3SA
	8vxMeYUNdqIdZsgkGoN9RTl8Sx25xQB2G3uikbVkbB5se3jwXV5S9d9c9eKvocBasTtlmYTpDKJ
	frWQvT8UNhxrE41s/38LWJ6LXjQlgHHyf/nDrP98GxdHzbs1VzVH0ojhnpixCUVeyJYQmWpa11L
	NP8nOzC9n564UH85KTJnDOJmzArVzzXRrLanwLLxauY0DmAZPPUrpE0IN5PUvMtk4nVb39fhYVW
	kB2EMKZBDoU/sdS4FCW88IJsG2winpn9Q2H/CTDgAdH2rsLNJW+2s8SsjC+oFFXE4nXudvV1SE3
	lWziyRXo8pGJJJOtdpKaGSVsBtW8pw/aN+A==
X-Received: by 2002:a05:6512:3c8e:b0:5c1:ac5f:e596 with SMTP id
 2adb3069b0e04-5c1b40e9b72mr9362e87.23.1795038584801; Wed, 18 Nov 2026
 13:49:44 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
 <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
 <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
 <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
 <20261118-stapeln-eckpunkte-lesbar-ee73537f474d@brauner> <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
 <CALCETrUMNr=32ENT6VBKPzoyJDfaX6nzZsjMVxuz9O3z+6LRhw@mail.gmail.com> <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
In-Reply-To: <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 13:49:32 -0800
X-Gm-Features: Aa3M54rEY9J5hVHcO1DPxjhsi7Vv-UveBjN-XrYjaJlUs9gt6QOZEnzJ-89YhLo
Message-ID: <CALCETrXAGpb=OZyGQ2=VfKmA6xeizAsusGZ_HmRtp_s99RpRJA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: lennart@poettering.net, Jann Horn <jannh@google.com>, 
	"Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:37=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 18, 2026 at 01:12:45PM -0800, Andy Lutomirski wrote:

> > > > * deny privilege gain on exec in the initial user namespace and all=
ow it
> > > >   in nested ones. I mused about this in
> > > >   https://github.com/uapi-group/kernel-features/pull/38
> > > >
> > > > Also, since v7.1 there's CLONE_NNP to spawn a child without no_new_=
privs
> > > > set.
> > >
> > > Forgot:
> > >
> > > https://www.thkukuk.de/blog/no_new_privs/
> > >
> > > has an overview of where we're currently at.
> >
> > Nice!
> >
> > I commented in the uapi-group issue:
> >
> > I think there may be a rather more direct solution to this problem. I
> > seem to recall advocating for clearing no_new_privs when entering a
> > userns way back when, and IIRC I dropped this as part of the extensive
> > negotiation to get NNP into the kernel in the first place. (I think
> > dropping it was probably the right decision to keep the final patch
> > simple.)
> >
> > But I think I would still advocate for an option to let clone, unshare
> > and setns callers turn no_new_privs off. The logic is that, if you own
> > a userns, you already have all capabilities in it. If you enter it,
> > you get to keep those by having them raised in cap_permitted. Being
> > able to clear NNP and thus drop and subsequently regain them does not
> > let you do anything you couldn=E2=80=99t already do.
> >
> > An LSM hook for this would be needed because this argument does not
> > apply to non-namespace-scoped LSM-based privileges. But the LSM hook
> > would just be a "may this caller enter this userns and clear
> > no_new_privs while doing so" query. In the absence of LSMs, the
> > operation would be allowed.
> >
> > This would allow a fully no_new_privs host to run an ordinary
> > container that runs, in the ordinary way, without no_new_privs, and
> > without hitting any new LSM calls after it's started.
> >
> > The API could be as simple as a CLONE_CLEAR_NNP bit.
>
> I think that sounds ok. I worry a little it since it would somewhat
> alter the promise that NNP gives. What model do you envision?
> It seems that CLONE_CLEAR_NNP would only be allowed with CLONE_NEWUSER.
> I _think_ this safe even for privileged users that create a user
> namespace and map uid 0 to uid 0. So I think this could work.

Whoops.  I thought that and didn't type that.  Yes, I think you should
only be able to clear NNP with CLONE_NEWUSER.

(And if something like cells ever lands, presumably a task with NNP
set should be allowed to create a cell without NNP in the init task as
long as the same LSM hook says it's okay.)
