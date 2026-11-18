Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036380;
	b=3Q50x+hd+KJY/gOITh6AOm8BasFhBlyBNtLYRo9r3Ug2VvAuVQryPsNv3+FG3S4BjDZf
	 pbFFeuu9bEymTqcQBOTA0htinBchM2/Wk7VuIt254nn4iF4aW050KUPp9MonctSU7Fxkr
	 zBcfrDyOAb4AzTOKZBBmGka6fD9PwURmVkIJj3MULVOVc8mmY68fgqPGJS5sTqk3ZVQkI
	 CmFkux+d4Hu3Disy7kAl5Pj2deqXm9gMssEqJi/B9g3N1Q1tuinzVPFBVPNftQDXCwEJm
	 AjRQBubYyp3NSQ+YNtDEV6zhAbURZzNUn3JD2j8Xs85SDYS6Di3K+s+Ku1KFUKc19pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UWi6aWIYE+fT8OrBO2DRorgL1+pOEdt+mwu8bkfCsP8=;
	b=WpOpAWlFSS7b2Vv7cvNGvwv3MEz9HlMblS4UArV/AiH0aa6Lhqroge2iLdz24LGiyNbR
	 aTgFJdKzaiclqRoALo+7m/ZiM6tZkLjgtX1uU2bzuPL6WGwOm9pJY7RWWJqnSIvhrJc6w
	 R4aGbbH1VK1FKkW7cKOGtU4w/te9iydBEGBQot4BorN498T3AdeoAFcQSLtumxfidQ56L
	 1WhT/r+fuF5dCtii+fYFtzVZDKJbmNf8GkJf7wZXvXuVTSaJe5/UTa9IcDeH8h+QKo/zf
	 Zb4WpCqswPtkhsvrH+Bo2OJUHJINhoxfnEF4R6zR7lgk+25OZfqvDGMby/tn3wogzKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kgM+94wM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCF606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FCF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kgM+94wM
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so13415361fa.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036378; cv=none;
        d=google.com; s=arc-20260327;
        b=sjRfULGoIXAqc99V8+s/e1hClfj8e/+06UNRPmZZotFLF91KifgePxuyYBdgVZAsBa
         jNOjlwlB7Mvvg/44T42QxJ3o7ayd+S2xKTw4J9AOuO0mGCp0QqhAJSmvu9AO5qodWSQ9
         Txh9oiNHdZx7vh/KrCzPH8jsjd2ytzX+aVG4i0b3+eksG5gnAPlx6QFzVeKwTQPsRzPI
         GYdbAHiRwAKMzoYTB3jRgbHMpQRnVTFk8eWXUpDvOKmJS1UUOlY0DY0zy99iXuEDmUrU
         I8tBZvIPgxRfMBfJ44AABBYCgm8MOUZ9Kfeghz84BwIFUyeboLd7r2FTQxXP8L6dRnzu
         YKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWi6aWIYE+fT8OrBO2DRorgL1+pOEdt+mwu8bkfCsP8=;
        fh=IcVICBcEzIY9Gc/CdjOGViY0ZJfU34ZefifUELDAomo=;
        b=F9IOPj1c9O7A7OhKu90AZeUQRdkWhVxR4qtPcjvDpWOKNNMLO8PdWvW4Cve580LvGH
         2dELh3jyBKhEV78S8OAIqe/SxlHVdpKuITFC2k6kQ1LC5Idr/ANX73N+0WrFwWrxuKcO
         6Vq/UBtvMy+rF8G6bAxZNdwFVXCuzMWHfGg3tPBcu0wg7DU2wuLj335oIDwlgXlP8zbW
         7QlV2Xt5GRVpZ6mzGvCvyCdfCjhVW0lLe3VRzSvDl1yiB846DzLAlRNy0rP+2+I2M/Ow
         xoh0b89/T9/aYqa8lyLW4t+AR7yH9otYqbwEwKMAOnU+oGtToils3ZHb490Tgg5lflwN
         C6lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795036378; x=1795641178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWi6aWIYE+fT8OrBO2DRorgL1+pOEdt+mwu8bkfCsP8=;
        b=kgM+94wMeRVtqQuKMf2voBlp/7mmBGB0wg6RbakCJoZIUyenSlHL3LjFrlxAtFmRFC
         S8KP6bDmaJ7+KmKrve9oF+DO15q0bbfeomzd2ANxZbMI9Wp5wEKb9CT/PHzw6w7N6PcZ
         GWqEGss6hqHZ6qOh4V5IDyC8g4dQFp55046Gobv711dFigyzVlHjLWJxvrwr4Q6yCm7l
         rXKICef3dz7+oPENdL0yQHlDHryjcIFh5nBw5N/VbP4d6AEEi/4vp9fZgJ5mH/3XitRH
         0F8PFxwchkMjqaIbMoygjydckD09A1fliBgC9Y1ht0h3X+h9AJLtWZf4e+6lb1uNuTx/
         xa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036378; x=1795641178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWi6aWIYE+fT8OrBO2DRorgL1+pOEdt+mwu8bkfCsP8=;
        b=C/3+7UYAxUO3MCtKhWDrfJGr47odXU6Ckg2KSW/NYOxYRyFSyNYQJwnKFvnFMSu/w5
         WDh1j3NbSS/sXfQ/UVbs3ieS/1BfchOZI8DImSU3m9CEfGFxHs+MqeLMcz3YxfC0qiTo
         AuvDLEqfulCM1zPnvOUSqcVHwOvrJ0pVl+6NcTXLc1gIS9W43V2V/jO+XbxA1fPWnyiq
         MoP1p3N3UAPpzXErO8As1q++eAaOOzAWeAjF+IFXInijJ5sfbrlSQp9+hQfZWn2i+3tR
         KtPtrIyLV3EOwUiPWcD84LqfrCykRDsYJDVdaQvJoFaT0I0EGRyGeX8RFJ0GEJZcZHU4
         yCDA==
X-Forwarded-Encrypted: i=1; AL+hErGjdZAlk0netSzACJVqptT3h35ei3KhWgmAiJZrfvIhB3S4Ngr6iLTf6CiktvJwMkg8riMz+2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yQdhuqa7ISA80seHq9FXt6skkRaM8yZTqkGjcXrxEZthR0bwD
	su8GtoeY7xXbkHOwM1lZ/2WO8lTmAwLPqyC2Vwal9LufXI1YpK5RZE+vca17/wAwqfrzPGVPrBx
	WiIkT5PIlKYPXK9cQQptefhKHcMSzbjt4RdCPKvKV
X-Gm-Gg: AYBFou0ipfpDcm6+ZRogwp7NIi8cJbwk6REh21WPw29A5n8EXFjdN4JSHCEi2N85ufW
	z0au4nrUGoL0MhMoc+DOhrXzsnyOqF35T9k11fEJ6cOw3ME3JS6RsxpqKkgjuP/21ejBlpTj861
	bavBDHy1DTO7nHicP1Hvmz9L6htTfVrLI3wd9q7Ef7XOKtWaLXnf+yqNc+waB9AFCnhF7gg5bzI
	KSQcKfSXxRyOHtqINsB6D2AI0A/17pD4qBR2TdGBhXZOpfD3DtUYIVPNJjLbW21LEZ3ftXmwSN8
	6M/trEY3jeaskwMUX01+M4VXALU10prfScI8tSOlGRu2DA2628DsUjC+YkGWqMEuRnSCu/mwRfv
	WOlvtADXwjnCp4pYfX/5qKXMhBDiW86hSSQ==
X-Received: by 2002:a05:6512:2387:b0:5c0:209:a85f with SMTP id
 2adb3069b0e04-5c1a9c1b551mr1282932e87.25.1795036377561; Wed, 18 Nov 2026
 13:12:57 -0800 (PST)
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
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
 <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
 <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
 <20261118-stapeln-eckpunkte-lesbar-ee73537f474d@brauner> <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
In-Reply-To: <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 13:12:45 -0800
X-Gm-Features: Aa3M54o7fZB1Cpe0ST_SUtYpCXQerdKYt_ETG0v-G2QE_rfSU2Am1PRKK-TPOCc
Message-ID: <CALCETrUMNr=32ENT6VBKPzoyJDfaX6nzZsjMVxuz9O3z+6LRhw@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 1:06=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 18, 2026 at 11:21:57AM +0100, Christian Brauner wrote:
> > On Tue, Nov 17, 2026 at 09:37:19AM -0800, Andy Lutomirski wrote:
> > > On Tue, Nov 17, 2026 at 9:10=E2=80=AFAM Christian Brauner <brauner@ke=
rnel.org> wrote:
> > > >
> > > > On Mon, Nov 16, 2026 at 09:15:18AM -0800, Andy Lutomirski wrote:
> > > > > On Wed, Nov 11, 2026 at 7:20 AM Christian Brauner <brauner@kernel=
.org> wrote:
> > > > > > * a task that setns()es in later gets
> > > > > >   ns->cap_bset & (cred->cap_userns | cred->cap_permitted)
> > > > >
> > > > > I'm not sure this is ideal.  If a task has cap_userns & CAP_NET_A=
DMIN,
> > > > > then there is no attack surface issue with allowing it to enter a
> > > > > namespace and be NET_ADMIN there even if the namespace itself has
> > > > > CAP_NET_ADMIN cleared from cap_bset.  But any exemption here woul=
d
> > > > > need to be a new API so that it isn't used by accident.
> > > > >
> > > > > I'm mostly saying this because container managers might want to
> > > > > restrict cap_userns within their containers but still have it
> > > > > themselves for management.  But maybe there isn't any need to ent=
er
> > > > > the userns for this purpose.
> > > >
> > > > I don't think there is. A manager that holds the capabilities itsel=
f can
> > > > just do most things from the outside. I think it's nice that once y=
ou're
> > > > inside a namespace you're bound by its capabiltiy set. Otherwise th=
e set
> > > > isn't a property of the namespace anymore. If someone comes up with=
 a
> > > > real need to enter we can add an explicit opt-in later?
> > >
> > > Fair enough.  Also you've written infinitely more nontrivial containe=
r
> > > managers than I have (I've written container managers, too, but
> > > they're all special-purpose things that don't do much in the way of
> > > actual managing).
> >
> > So I think this is another instance where we're bitten by the complexit=
y
> > of the whole namespace api. In a perfect world our answer would be "Yes=
,
> > the owner of the userns is definitely capable of performing all relevan=
t
> > actions from outside the userns.". But we're actually not able to say
> > that because there's so many different ways how some <object> is set up
> > or configured for a container and nobody ever sat down and defined the
> > model how a container and it's various resoures are set up.
> >
> > So once again, here we are guessing our way to a decent decision...
> > Thanks for helping with thinking this through.
> >
> > > > > > * Root in a container has caps as well so for containers the ex=
emption
> > > > > >   would be wrong.
> > > > > >
> > > > > >   So here we need a a lockable SECURE_NO_USERNS_CAP_RAISE bit t=
hingy.
> > > > > >   This turns off the exemption and prevents raising the mask.
> > > > > >
> > > > > >   Docker lowers the mask, sets and locks the bit, and
> > > > > >   unshare(CLONE_NEWUSER) in the container doesn't hand out CAP_=
NET_ADMIN
> > > > > >   anymore.
> > > > >
> > > > > Can you clarify this part a bit?  I'm not seeing why Docker shoul=
d be
> > > > > special.  Shouldn't the inside of a Docker container work as much=
 like
> > > > > a normal non-container system as possible?  What's the use case?
> > > >
> > > > I picked Docker because you brought it up, and your goal of allowin=
g
> > > > user namespaces even in Docker is kinda the use case. Docker can on=
ly
> > > > drop the CLONE_NEWUSER block from its seccomp profile if nested use=
r
> > > > namespaces can't get more caps than root/Docker wants to give them.
> > > >
> > > > But the bit isn't at all Docker specific. Any privileged task that =
wants the
> > > > mask to apply to itself would benefit. With just the exemption this=
 wouldn't be
> > > > possible:
> > > >
> > > > (1) A runtime that holds full capabilities gives a
> > > >     user namespace it creates all bits.
> > > >     It can just set the bit before creating it.
> > > >
> > > > (2) In a container without a user namespace container root has host=
-level
> > > >     capabilities. Any user namespace it creates gets them through t=
his
> > > >     exemption thing. So it can also add them back to its mask. And =
the mask is
> > > >     inherited. So every process it starts can then create user name=
spaces with
> > > >     them.
> > > >
> > > >     by raising the bit we stop both. The locked bit keeps container=
 root which
> > > >     also has CAP_SETPCAP from clearing it.
> > > >
> > >
> > > I'm still not 100% sure I'm following this.  By "exemption" are you
> > > talking about the cred->cap_premitted term here?
> >
> > Yes.
> >
> > > ns->cap_bset =3D parent->cap_bset &
> > >                        (cred->cap_userns | cred->cap_permitted);
> > >
> > > (As as aside, as formulated, the parent->cap_bset term should be
> > > irrelevant, no?  cred always refers to a task in parent, and this
> >
> > (
> > I don't think it i.s
> > cap_userns is full by default. Entering a namespace doesn't change it.
> > A task inside a namespace with a reduced cap_bset still has the full
> > mask. Without the term a child namespace gets more caps than its parent
> > had.
> >
> > cap_permitted can grow through a setuid-root exec in the parent
> > namespace. And that exec is bounded by the tasks bounding set and not
> > by the namespace bounding set.
> >
> > So that term ensures that the namespace bounding set shrinks
> > monotonically by construction.
> >
> > I think it would only be redundant if exec would be clamped by cap_bset=
.
> > I'm not sure if the patchset does this.
> >
> > /me looks...
> >
> > Ah, ok... this patch series already clamps exec to the namespace
> > bounding set. So yes, you're right.
> > )
> >
> > > whole thing is defined so that cap_userns and cap_permitted are alway=
s
> > > subsets of parent's cap_bset, right?)
> > >
> > > I think I agree that there needs to be a way to turn the cap_permitte=
d
> > > thing on and off (and I'm also not sure whether cap_permitted is
> > > better than cap_effective), but I'm not convinced that an inheritable
> >
> > The effective set can be raised from the permitted set at will. So I
> > think permitted is just more correct.
> >
> > > and lockable bit is necessary or wise.
> > >
> > > How about changing the rule to:
> > >
> > > child->cap_bset =3D parent->cap_bset & soft_cap_userns &
> > > (cred->cap_userns | cred->cap_permitted)
> > >
> > > a) (ugly but easier) A non-inheritable prctl-controlled mask
> > > soft_cap_userns, changing the rule to parent->cap_bset &
> > > soft_cap_userns & (cred->cap_userns | cred->cap_permitted).
> > > soft_cap_userns would be reset to all ones on on fork and exec to
> > > avoid creating new inheritable security-relevant state.
> >
> > So both let the creator pick. But the bit is for the creator when it
> > wants to self-restrict: container-root without a user namespace.
> >
> > It's the same reason that securebits and no_new_privs are inheritable
> > and lockable. Afaict, a) is reset on exec so it doesn't control the nex=
t
> > exec. b) covers namespace creation but not unsharing a user namespace.
> >
> > > b) A whole new create-a-namespace API where the caller chooses
> > > soft_cap_userns at the time they create the namespace.
> > >
> > > > On the host none of that matters as the mask is root's own policy t=
here.
> > >
> > > I'm still not seeing how there's a difference between host vs
> > > init-userns-container vs separate-userns-container.  After all, in
> >
> > I think the difference is simply whether the restricting task holds the
> > capabilities itself. Unprivileged users on the host don't and so they'r=
e
> > not subject to the exemption. The bit is for that case where the task
> > holds the caps.
> >
> > But ok, if we really don't want to bother with container without user
> > namespaces the bit vs a) thing can also go into a follow-up series.
> >
> > > Unfortunately we don't live in this world, and I'm not convinced that
> > > can credibly even approximate it, because people really like their
> > > setuid programs working inside a userns.  It still bugs me that we're
> > > designing permission systems designed to work in the POSIX model that
> > > I think we all kind of agree is fundamentally rather messed up.
> >
> > I don't think all hope is lost. We have slowly been pushing in this
> > direction. systemd allows to set NoNewPrivileges=3D in it's global conf=
ig
> > so it's possible to enable it for the whole system easily.
> >
> > There's been a ton of work to get rid of classic setuid-exec stuff:
> >
> > * run0 instead of sudo (with sudo compat), and systemd-ptybrokerd for
> >   interactive shells
> > * nsresourced for user namespaces with delegated ranges, mountfsd for
> >   unprivileged image mounts
> > * outside of systemd: pwaccessd/pwupdd/newidmapd replacing unix_chkpwd,
> >   passwd and newuidmap/newgidmap, polkit without a setuid helper, and
> >   su/sudo/pkexec wrappers on top of ptybrokerd
> >
> > But yes, containers are the sore spot. no_new_privs inherited from PID
> > 1 breaks setuid inside of containers.
> >
> > My idea has been to make this dynamic:
> >
> > * deny privilege gain on exec in the initial user namespace and allow i=
t
> >   in nested ones. I mused about this in
> >   https://github.com/uapi-group/kernel-features/pull/38
> >
> > Also, since v7.1 there's CLONE_NNP to spawn a child without no_new_priv=
s
> > set.
>
> Forgot:
>
> https://www.thkukuk.de/blog/no_new_privs/
>
> has an overview of where we're currently at.

Nice!

I commented in the uapi-group issue:

I think there may be a rather more direct solution to this problem. I
seem to recall advocating for clearing no_new_privs when entering a
userns way back when, and IIRC I dropped this as part of the extensive
negotiation to get NNP into the kernel in the first place. (I think
dropping it was probably the right decision to keep the final patch
simple.)

But I think I would still advocate for an option to let clone, unshare
and setns callers turn no_new_privs off. The logic is that, if you own
a userns, you already have all capabilities in it. If you enter it,
you get to keep those by having them raised in cap_permitted. Being
able to clear NNP and thus drop and subsequently regain them does not
let you do anything you couldn=E2=80=99t already do.

An LSM hook for this would be needed because this argument does not
apply to non-namespace-scoped LSM-based privileges. But the LSM hook
would just be a "may this caller enter this userns and clear
no_new_privs while doing so" query. In the absence of LSMs, the
operation would be allowed.

This would allow a fully no_new_privs host to run an ordinary
container that runs, in the ordinary way, without no_new_privs, and
without hitting any new LSM calls after it's started.

The API could be as simple as a CLONE_CLEAR_NNP bit.


--=20
Andy Lutomirski
AMA Capital Management, LLC
