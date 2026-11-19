Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085236;
	b=K6GVd94jScszWCM8KiTcLjnA0QySNKNY/G83n+mth3YYBA2df/TNiUiS9b4ZHq7jL6zH
	 mlAinfTBERX5bVMSN5oRV8/DsaDvEN4xYKDV4BmRiCtBvsLLetOb8VWghqOjnY5leA8aQ
	 v6PACr+2wqAOYh8Y1N0DykroRGpXJGbVV4AAKjUmZc6IKeG69HQuhy9nksDqBc6B/lNU2
	 wO+ClkT5cumd4MxZfPcOkquo1GF671K3oGXvv7oBc9TdaxSb9AW0uHhI1eLaMKGhM3oGn
	 GR/OXpmgQwkfXqx30oLjfHBOL7ElhPWDy3njdiEguxBDkOG3zErVG8pyH9n1qHDiacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
	b=HZjsuc7wUet/EIZx+HUBRoQQd+tddWLW5zVrG+lVUjj7b1ErC/iWuVl/vG4My7L3ksk0
	 rNHNCtzzFfvbKqNlVv3fCZoJ+stf7soGB2TWdRxouLKdudwGMUnSe8Vvmbhk9ZAcvOdJn
	 noO9sRigRzb8UuD9qBcwvR4M5fo4yj4KJAI8vKAy1XE54ydz/2kgmcMCUy8q8S6C5No7U
	 Ou0wFPzXOExvoqLcW4v/pm9yytpHPOWwIx+QrWIqENXahKg7KV+By5fsDmHgeK6t3M4+c
	 iNodATZ1SH/7Oq36SgK42foruxjKKsGsxUyu65tSlIQ3xjF7/9Ef2qEbtArTFgE7f3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdNKDppB;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7B606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF7B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdNKDppB
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso18723785e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795085235; x=1795690035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
        b=NdNKDppBshR3yFJ0FfbOWsYgjw9irAEaVT/7IxVBjACSprcjw70nJAaThe4TTE+dBk
         UInzrM8KIqiFSmvFBXVwwQFzSfHXLRF4YLznNEgsA197A1YdVcYipcpKCnel74Lh3uP3
         IJU8KmNQDE6rlRrjF6eygat4qW2/xwIgaKCTrFmzkS0v7LtEztyWb9t1xJsPCF5aMRuU
         AIOVlCWj4gpRfMcPCpCzLg8bap7PiOOE6JeYbZy0QxdKAoWH1AASpuiixOTlS7ayd7/G
         VorTt3PcndgbOdBiGT0Q/3kekAtTPAvN9t/QClLjiNey7MLYcj9IijV1Jh+gIk3Z/tIK
         upLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085235; x=1795690035;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67I3bNEfcu+N7yXs6EAi+/lBjbBrobM44S6SPv9jyFg=;
        b=dGjzq8m4Ed5foFBSC0FT/mmlKcYdsCDqvpEAXNjH8bIpBWQGjW0rU8y29MimBKteGu
         3ISUxCHETVjEbRYBS/rrO4+C205p6rrQcl6DWzN5edkj3vQ0+JxdEgyFP+PaN29Ymhes
         a7ja467950iSQpZ15r3zTAMtjjX/O6xjz3Q9HlpSfJKoWoQmZ/gCN2YmX2nLL0ofBeHb
         JcvHR5beFS5n10SXlvUdwvZtPHskSEFSujtoXSVo3RinH7Hh3ImIhBcCX/QHFDW0/3uz
         8+XXut2iWnd0Qfdv9UfCQ7U7IerXT6lhvS2vgPi2bcCrt/Qv/e7fZ+DjjyAbmGrNHeLJ
         O5FA==
X-Forwarded-Encrypted: i=1; AL+hErF27K1YYPPC2A1KumiT4Bpv7E0L28Akqaa7PhYOyTBo7Pq2YzC7hBU03v8mchUuFBSJWJd01N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DK1PdGA9KfoqLUa+UGlEHfug1b3BbZs9QRigUiwQzlnHaB2QD
	7xUXSYE5ufm/dmxryjoad7QKgLoxFsVdQkIjBqnIS1HsFHLXyiUyy4cYaKXhzH/vLOgztgsU7w=
	=
X-Received: from wmwb7-n1.prod.google.com ([2002:a05:600d:4447:10b0:4a1:a2ef:38dc])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e56:b0:4bb:7581:2bb9
 with SMTP id 5b1f17b1804b1-4bb7da3003emr104763395e9.22.1795085234352; Thu, 19
 Nov 2026 02:47:14 -0800 (PST)
Date: Thu, 19 Nov 2026 10:47:13 +0000
In-Reply-To: <20261118.faiBee9Taigh@digikod.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <20261107.aighieG4Ami1@digikod.net>
 <20261118.faiBee9Taigh@digikod.net>
Message-ID: <av7TsXKUE69lyiWl@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 03:43:03PM +0100, Micka=C3=ABl Sala=C3=BCn wrote:
> Hallgrimur, could you please explain why your use case would not work
> with Landlock?  The capability split or new clone flags would be
> complementary of course.

Apologies for the late reply.

Landlock's capability restrictions work well for self-sandboxing
applications and launchers. The main gap for our use case is setting a
host-wide default for unprivileged user namespaces while still permitting
exceptions. Because Landlock restricts all capability use (not just
capabilities acquired via user namespaces) and its domains are strictly
irrevocable, PID 1 cannot apply a default policy at boot without
locking out privileged services, file-capability helpers, and authorized
workloads. Using Landlock here would require explicit opt-in enforcement
at every unprivileged transition boundary (SSH, container/job launchers,
etc.), where missing any entrypoint leaves unprivileged user namespaces
unrestricted.

In v1 we had the global sysctl to tackle this. In v2 (based on Christian
and Andy's feedback), we combine per-cred cap_userns with per-userns
cap_bset), and PID 1 or a service manager can lower the default userns
ceiling once at the root of the process tree, while privileged tasks
automatically retain capabilities held in cap_permitted and can
explicitly raise cap_userns for authorized workloads unless locked.

Another minor difference is visibility. Clamping the task's capability
sets on userns entry (and exposing CapUns in /proc/<pid>/status in v2)
makes it easy for userspace to inspect what is actually restricted.

