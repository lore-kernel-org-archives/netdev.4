Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937054;
	b=MKlP4OkaKhPshgXQDPw3Cg3RCXHKqQjF/gfQCX6GyVUsWKYRtoiavWxgLhIWjLwze0j/
	 aACGj4K5auJZ1JJpJPDMSUwsD/d6b96ggEysQd3HwzpubhXP29ap2hTm/5+PmwkiwBbb+
	 wnoM8orYA5E6LGKvidAy1XqGUx+Pbp7atKutCkjVju/Iv1To2A314xIHfjSHJcYzhFt12
	 CL7KVxUQZiHl6lamx2CkeY3FQ5VSDP7MvMKCuE2c81rCr+uy93cj72khJET+O4ad9RQiI
	 tJS+t9w+27DeNnpFArsxJL06eIywjuvnUOvAwUKspipTjNTXVYc8c3NqRRU9Lgf0Q9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uIwpU1G0S/NqSFaGi3+jp2QeKv8+tYQDPWGubJQpaow=;
	b=Uo2hnvYujcx0sYXcLLek6zN/jjZfJXwVOOYXx7UuPIwy5oXEK2SNFK8JRWw1+/tQgla+
	 J3XSjODgB2JfqsICuIoUKmzaukWjb4y3wDqpCNb2Uu6beAq0/gVAbzx5Wnv6EnPwoHabr
	 VEYUJh9nNIPqaOvY7u8jQbJ9V3HpR2XfhaWys9VcSBwF57X9Tjp6qnY0PSbtPADr0lga5
	 JHPXxIPGFMGR7zGdpMIEax7LARglQLmnEItw7V/7jBHDq4SF1RVcOA8AIQ58jNs2Ia2Q5
	 7hTzxNGo+6X0dIrwu4f3jBMkDQ+m/JEpdhPAWiG5R3Jh0/FPLrE+r2/sX4VR3K1O6kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q65pbW00;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177A606A335
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0177A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q65pbW00
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso4385448e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937052; cv=none;
        d=google.com; s=arc-20260327;
        b=EgQXq8KW7rssHmzPwq0vle28jODbS2vlmOjt0bOqGbrua1SXqSnXMU4sm51z4G4nSU
         U+2gkNAV2FYdTTq/sveFxjXIbC5dN2LAOCeSm/l2Zzf4QwreW3EFinRVCdvlt/Ow9MI6
         9QouJb+xdH6pLEM5UORiKMb0J2imAyCKW5anFjOo1UdZbHluCBdKPHfgjUIut9ikLfxZ
         GhfSqILcr1djScUop98Qj0uY9s7r0naL2J30w56Pb/mr7+zUM4DbPtbU8IHtXcWwnFAG
         AobSzR8wIQdoIEuS1GabweJdKf8Gye/wu+ErRIxk23wrsITlWbFR4ihiUbGCF0N99kqB
         6J1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uIwpU1G0S/NqSFaGi3+jp2QeKv8+tYQDPWGubJQpaow=;
        fh=/hePK3iZILipQY225DWvUjAMIvjiYN867Z4ahY3mI9Y=;
        b=EZSbxrtBzq6ZBuXgXHnI8tYT0gAir7bzdF6nQv07TvOuklLXZpVc43boCYAm/woGDM
         1l9KF0rLrWbHQ9XLjE4xWKNnDVphdwd30/nyAcTeJeczpc0oauRdhuYfsYhJOG+eKVgR
         EeAOhiflJYAf18oQvLInH+M5Yl1SZxfaTaeo8mnofga6kuuCr8cl5gveh/pGCaObIHeX
         MZ66j6rANw9TKCgFh7JRdkrxG+rtNi6AnpTiMqTvl4Rx7UYAMZ/GfkzKzVS6FhtgqgNq
         XJr1igauv3fGUOARd+UkLVjU+I1gUdeV+Gum29mKwk4dmcy74tx8et4ipvqxTocXY0g2
         I1vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937052; x=1795541852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIwpU1G0S/NqSFaGi3+jp2QeKv8+tYQDPWGubJQpaow=;
        b=Q65pbW00pHc4gs6KcBvnyKXSyUuTE4JfrmIT6BLnsFPSBfFMXAqtD61+KCEATl4Uhe
         n1QoXCH9dZOtNmk7yDN7n+6kAjyfy8retEs+PZ6tfSfdQGIq9FUnZOktOKjwHqdFA0U/
         pU31o5bmeIj0QOEtlAvK+w2pCq3zPPO59ZQ8IX/g2NKs8AnP1pj6ieY5w4Z5OpyXvMt0
         qmrbgQus2dFV9Uy9SklULFVeaEYqFINed7N4faw6lHIE7N3emkZr72FzTVpCWSyv0FUJ
         lk7F07Ec5pi4GTUqmENNvo3BxxqG9rVt0mPu9/XYetGXV9iu0+sfFhdOAtGmR6e0rmBn
         mviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937052; x=1795541852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIwpU1G0S/NqSFaGi3+jp2QeKv8+tYQDPWGubJQpaow=;
        b=Uof1w9XcF7HSsFUcL6B73xmhxSLAEVOe82SrXE3oDAbGC66mSjGJyRSv8arAxZJr5I
         iYFxs+/uAlk6RoQOY1iA8Pchbg+MYmhuoFeulF3zCdG10rPSfDqFSDmE0+d6dfIDczq2
         6UCXGrOaeAOUth8NNh3uA3xfmhSBIoescwxvC91Zvbb2D9Qn5iBcyUCeTNaLztmZVX7e
         ZnsrI4f5InjPXuZibMX64lixFIYFd09ItUmCQuNDs3sefhwEwH6aGqpp8JCE42SUGSws
         75cY+vaAetBHcfO2UJhn+BEUGMBMyFOL19eJ/QLw6q+/03ycEhHyYc2x+jC1RRiOzR3c
         nstA==
X-Forwarded-Encrypted: i=1; AL+hErFivnRjm1Tmxl5QddPr2CX3qUgJGpK+B2BR6DS0/L6CYimpLJbQW89Fa8bgXChm9LE3h9lQ+qE=@vger.kernel.org
X-Gm-Message-State: APuU4Z90EpB9/VfdFr82R7FRRNr67tXqvoEQU1dBUrMW/yL1gc/Msbb9
	pJTrScToCTBtV11uBQgJYCqOSv1s1B8x7a2WIcEYEck5flnYWIUTYr0mTMt3v42ULBoBhY0db9Q
	rXOJD/Gsd/IHryil2DQcaAIuQ01O+8nUt8nG4H/A1
X-Gm-Gg: AYBFou3U+rJUf8i5NYkDFaGt8YMQ9Cp16+uJGrQvgQXaogG6X7jcLWigVCxRLZuNMQQ
	c5IJK1gfx/cnFn5KthLm/BodYitZwHtptEcCyO8wZwALKb8KeVWE4AEir3qmEaK6gqF+gfP8Gki
	FGCR/zWCBtBT091hFY5wqIoaLv+9gVwEvHmmextxBqGOlJlruvMoTnSeV80EXyEW1IlW/OTFjX6
	4MefzM0vLsFvCfpMsnBxsfxDb4Snle4nRPZdvQtOI4s50LK+lmDIckHEqgbshwkQ+8lKrrN08u+
	dsctv67NP26SF41NObxwHwBY+8Zz8lyJwkFDq5E/oMeR8RTjn5Npy2sCDezMeF6rBZvm9Ra/ILm
	uBSDf0PJNlLpCg31SGB0DPp0boCGJBLXoFQ==
X-Received: by 2002:a05:6512:33d5:b0:5bf:a4e4:c329 with SMTP id
 2adb3069b0e04-5c170a15b84mr5575263e87.64.1794937052080; Tue, 17 Nov 2026
 09:37:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <20261106-befreien-addieren-eislauf-e09212803534@brauner> <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com> <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
In-Reply-To: <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:37:19 -0800
X-Gm-Features: Aa3M54pEPEuG6xXoA_VcNPLpRvUBxQYv2Rvc07pMupzDgfrZ2jXEXOCCMAfHfMk
Message-ID: <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: "Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:10=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Mon, Nov 16, 2026 at 09:15:18AM -0800, Andy Lutomirski wrote:
> > On Wed, Nov 11, 2026 at 7:20 AM Christian Brauner <brauner@kernel.org> =
wrote:
> > > * a task that setns()es in later gets
> > >   ns->cap_bset & (cred->cap_userns | cred->cap_permitted)
> >
> > I'm not sure this is ideal.  If a task has cap_userns & CAP_NET_ADMIN,
> > then there is no attack surface issue with allowing it to enter a
> > namespace and be NET_ADMIN there even if the namespace itself has
> > CAP_NET_ADMIN cleared from cap_bset.  But any exemption here would
> > need to be a new API so that it isn't used by accident.
> >
> > I'm mostly saying this because container managers might want to
> > restrict cap_userns within their containers but still have it
> > themselves for management.  But maybe there isn't any need to enter
> > the userns for this purpose.
>
> I don't think there is. A manager that holds the capabilities itself can
> just do most things from the outside. I think it's nice that once you're
> inside a namespace you're bound by its capabiltiy set. Otherwise the set
> isn't a property of the namespace anymore. If someone comes up with a
> real need to enter we can add an explicit opt-in later?

Fair enough.  Also you've written infinitely more nontrivial container
managers than I have (I've written container managers, too, but
they're all special-purpose things that don't do much in the way of
actual managing).

>
> > > * Root in a container has caps as well so for containers the exemptio=
n
> > >   would be wrong.
> > >
> > >   So here we need a a lockable SECURE_NO_USERNS_CAP_RAISE bit thingy.
> > >   This turns off the exemption and prevents raising the mask.
> > >
> > >   Docker lowers the mask, sets and locks the bit, and
> > >   unshare(CLONE_NEWUSER) in the container doesn't hand out CAP_NET_AD=
MIN
> > >   anymore.
> >
> > Can you clarify this part a bit?  I'm not seeing why Docker should be
> > special.  Shouldn't the inside of a Docker container work as much like
> > a normal non-container system as possible?  What's the use case?
>
> I picked Docker because you brought it up, and your goal of allowing
> user namespaces even in Docker is kinda the use case. Docker can only
> drop the CLONE_NEWUSER block from its seccomp profile if nested user
> namespaces can't get more caps than root/Docker wants to give them.
>
> But the bit isn't at all Docker specific. Any privileged task that wants =
the
> mask to apply to itself would benefit. With just the exemption this would=
n't be
> possible:
>
> (1) A runtime that holds full capabilities gives a
>     user namespace it creates all bits.
>     It can just set the bit before creating it.
>
> (2) In a container without a user namespace container root has host-level
>     capabilities. Any user namespace it creates gets them through this
>     exemption thing. So it can also add them back to its mask. And the ma=
sk is
>     inherited. So every process it starts can then create user namespaces=
 with
>     them.
>
>     by raising the bit we stop both. The locked bit keeps container root =
which
>     also has CAP_SETPCAP from clearing it.
>

I'm still not 100% sure I'm following this.  By "exemption" are you
talking about the cred->cap_premitted term here?

ns->cap_bset =3D parent->cap_bset &
                       (cred->cap_userns | cred->cap_permitted);

(As as aside, as formulated, the parent->cap_bset term should be
irrelevant, no?  cred always refers to a task in parent, and this
whole thing is defined so that cap_userns and cap_permitted are always
subsets of parent's cap_bset, right?)

I think I agree that there needs to be a way to turn the cap_permitted
thing on and off (and I'm also not sure whether cap_permitted is
better than cap_effective), but I'm not convinced that an inheritable
and lockable bit is necessary or wise.

How about changing the rule to:

child->cap_bset =3D parent->cap_bset & soft_cap_userns &
(cred->cap_userns | cred->cap_permitted)

a) (ugly but easier) A non-inheritable prctl-controlled mask
soft_cap_userns, changing the rule to parent->cap_bset &
soft_cap_userns & (cred->cap_userns | cred->cap_permitted).
soft_cap_userns would be reset to all ones on on fork and exec to
avoid creating new inheritable security-relevant state.

b) A whole new create-a-namespace API where the caller chooses
soft_cap_userns at the time they create the namespace.

> On the host none of that matters as the mask is root's own policy there.

I'm still not seeing how there's a difference between host vs
init-userns-container vs separate-userns-container.  After all, in
*any* of these contexts, the configuration *of the host or inside the
container* might want to restrict cap_userns for unprivileged users or
for everyone, which it can do with whatever API we add to do this.
And some container manager might run with CAP_NET_ADMIN in such a
context, and it might want to create its own container that has
CAP_NET_ADMIN removed from cap_bset.   But I might just be being dense
here or I might be misunderstanding you.



There is one thing that continues to bother me about all of this.  In
a sane world where privilege elevation on exec was simply not a thing
(no_new_privs =3D true always, nosuid always, no file caps, etc), then
cap_bset is kind of irrelevant, right?  A task either does or does not
have NET_ADMIN, and it either does or does not have the ability to
create *a task in a new userns, including itself, with NET_ADMIN*.
Since our API is based on creating/entering a userns as opposed to
spawning tasks into a userns, the rule should be, upon entering a
userns:

    cap_permitted =3D cap_userns

or something to that effect.  Or maybe:

    cap_permitted =3D ns_enter_requested_caps & cap_userns

and cap_effective and ambient get clamped to cap_permitted.

Unfortunately we don't live in this world, and I'm not convinced that
can credibly even approximate it, because people really like their
setuid programs working inside a userns.  It still bugs me that we're
designing permission systems designed to work in the POSIX model that
I think we all kind of agree is fundamentally rather messed up.

>
> > In any event, the ptrace access checks also need to be updated.  If
> > we're adding cap_userns, then one should not be able to
> > PTRACE_MODE_ATTACH a task with higher cap_userns.
>
> Yeah, I mentioned that in my reply earlier.
