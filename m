Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847388;
	b=GdKSZAGc0IAaElTX/0B3afc2cPSq4nIMPU2gU00GIGwj7u+Ly1PbZk+d6Nxaq9PcROwe
	 IrJBV+moyw1B7XQSuET6D1RMnKx2q3oPinqiTulKLhX8Mh4COez4ORMbWqSFjx39TGd2I
	 K3m0qMJFE2wznUwkfhf4wj5S9usIWuW+/Vo9/j9tluG2tUHDb7Ig6fdQxT1kdNBg0ZCTF
	 GEribHTsxHfh0qLCNK+i1RqvIyGXvYPjF1bmRv/RsOpr/UPmLHm4EqNtUgRpoe4DMHJZW
	 bzBDvwUj6+HDvsNo5zjm4Y5WXBAjm9jyr6gNRWSx73CX8k5B/WjtAu5bcycDti+48uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
	b=XCFa6ag8YOEowpr+DA4FzWqVVMkCM8miUpZIS2kWtOImrGsk4pKGseAzPND7TfqfH7K4
	 CNP/Jy3lWAS/U5M4P+LkVhfaysccJLjTIFAFBurwANQg4emBEUKJ07Wo5ib7Kitc1FI5d
	 /QOpybH7fJvmeYvWSZAJbAqy2MGur5g8JPVurmpGsWj+bWtLr0HLgN2xXXhq0CI/AX81A
	 4iu9SaCkF9c9UkllDW+KfHF+33Xx2JKqiU1XLU+kqP4JyzQurFvaDNkMjDsGy1HPe3n/b
	 V0IrcyYRJGRrKdB/CKYnnWYrOhgUH64HEphAqzf7LOp0/iL7qFpwE4wiufG9Zx4vvpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHD+g70C;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68143606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68143606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHD+g70C
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50657eaef0so369700766b.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847387; x=1795452187; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
        b=IHD+g70CMjjDb+lNyaZS7FPrR9hKiBjI6am80yEPTtTB9qWtugwit+DSXHqY66L98K
         8EtcQ72+xPDDvax/dKjPailSRAMm2iFoAICCBJiaKhmJXvLESaGHskyifSodaT1tRs2k
         FnHt0a2P09ARVfqqIUhh4npU9nurbR746tcMFt5h0VvYTWxJ99h7V4nt5AdC5Xn+RuNw
         R+UPfCjsMpCI0kZGUr8m/0061Cxdd4HI0FJsop35cbdBWrApwuRCUgB8AqRfgWVySydR
         5NYVgGLoJ1FeSnqZ87k51s8BnWjIU7UBqdkx4H+pPBId62cZa0wxGpKqydkewL7P/Ubz
         LItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847387; x=1795452187;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
        b=QebO3i3JOamiPCJ7gcDtda17HFTvEWsurgAmJ1J+6/TwdftLAorjg70K+iPUlpjruv
         GQfsMxs9QuqBtebtueaQuCgRodYdQb/9lW5yTAa0z9rzUHM/1AvEqfTU16U+HovhBPcS
         FRouPbHivCtki1oh1KwYuwMtzT9Ahq2+q0mlyIZ7CRnxcYnmZRGmgIkCkdW/duRSX4/V
         TP9yroq5Y2Dl1tvMwDOUGnOU1x1kmUyJrSFpSM6TAu7PiZX3yGcAreP3ZDCSgVMgYvBP
         vNcXCnbTqttDSTWOuiWPwZSyn/7XuQCVez5T94z6pUq9dt/a0dNJXlf1kuXgBdSJ/AOe
         i7/g==
X-Forwarded-Encrypted: i=1; AL+hErH7S+aejkDiWLEjEkWWmp76SaBAk9COSNPecETTJCtPfhCY2s6GMecatfiITU9OWf06HjFu78E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SGqJ+iiRjQOeywTmzTGsu+VwFVJJa9gLiWNV8nJdIxM2ESNO9
	WaE3OFeiM/1FfDxnNuATMd8ym7tpM5SVxVDz8R05RO55HZRfzIL1fedBJtTvZ8JvcZ45W5EbGQ=
	=
X-Received: from ejja21.prod.google.com ([2002:a17:906:3e95:b0:c3e:edc5:36b1])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d08:b0:c34:e9fe:82ed
 with SMTP id a640c23a62f3a-c50963d803amr901765866b.28.1794847386433; Mon, 16
 Nov 2026 08:43:06 -0800 (PST)
Date: Mon, 16 Nov 2026 16:43:05 +0000
In-Reply-To: <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <20261106-befreien-addieren-eislauf-e09212803534@brauner> <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
Message-ID: <avsymRBSulVZfouF@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 11, 2026 at 04:20:02PM +0100, Christian Brauner wrote:
> Just a note on the essay I cut off. I really object to any arguments
> that amount to "it's too much work" propped up by a few thin arguments
> sprinkled in such as rtnetlink.
> 
> I also reject any arguments that amount to underscoping and overscoping
> of the new capability. The scope is clear: empty netns with brought up
> loop device.

Understood, thanks. I'll split the loopback work out into its own
standalone series and handle it separately, keeping the scope strictly
defined as you described.

> But again, I'm more focussed on cells so here's what I find acceptable:
[snip]
> * a new CapUns: line in /proc/<pid>/status
> * new audit mask in AUDIT_CAPSET record

Quick question on AUDIT_CAPSET: today it's only emitted on capset() and
only logs capability sets that capset() can modify (explicitly or
implicitly like cap_ambient). It does not include cap_bset which is
modified via prctl(). Since capset() never modifies cap_userns either,
does it make sense to treat it like cap_bset and leave it out of
AUDIT_CAPSET, relying on prctl auditing instead?

[snip]
> That gets rid of the sysctl, the clone3() field and the clone flags,
> doesn't need a new capability bit, and nothing changes for anyone who
> doesn't opt in, I think.
> 
> And that loopback thing should be its own series. Not as an nsfs ioctl
> though. All nsfs ioctls only report namespace state and I'd like to keep
> it that way.
> 
> Pipe this through an LLM and make sure it makes sense and covers all
> holes.
> 
> Thoughts?

Thanks for the feedback and the detailed proposal. It looks good to me
and nicely ties everything together. I'll prepare a V2 for review based
on this hybrid design.
