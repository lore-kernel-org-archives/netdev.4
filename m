Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794969186;
	b=CJPf+dA5WEdL5eeMAzN/xeKQlbKpOzwhSBVqV5rEzucu/rhVa2JXCqLiEfahWzbuN5tL
	 9chzPJ919UbPBVUMpZM7xB9G712B8AJPGNJfWv6z82gsL2GYxc8C6psvE1vWfl1zv/KuU
	 5nd1hhRqcPTd/NQGnbGmQo279L2oUMkYt+f3khKCmE/fPeo3MUwqZTCFgvd+iEXtzs0G6
	 9PvXyjFXM4vJsIaa6LE0MwW9BDD0bG5CYYFMzXVADarewAnbJM9YjShmtfXjO0ZgZ+ZD+
	 lcYPzg5txjV07kuT40I8J7byfQpDlO4+FhdAoTp5f+6XxIc75j7Fts7MPUpBqrPvApA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
	b=Djuum5vyC/+l6LJKWrynO2dgj9Jr0V4jJN4BM9jeb1ZR5PWqIL/c+2l8sEjBTKis6QSP
	 GolCrc4N5ZeJkg/ug/54pbmM+5fKniNPSdaphZqVhuA7iHSCN+4Y3SbJ8MtmlskpIsS6I
	 WDitIebfJGaJyi8O43OOPidF4u+feUCwaVDb1UXJvBy8DPhVqHfA0O+V2n2RyQkA80PvR
	 h+KS6xzKBrQlwFD4o5K9O2kL7D841u9vi5j/JuAgdKjUxt3odk6KgdQEvJa1YPO8LqjxX
	 bkX+9D9lY+FbI9bUSL2KW6gqOA4EHzZfLuMYfxBokrIz0b5OzPOHZnuwVCwqQjS9SBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8627606A330
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8627606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brQVox1F
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ec690faf85so157178e0c.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969185; cv=none;
        d=google.com; s=arc-20260327;
        b=X4QA0bBWqN8RI+Q8W040a+GeOeCiyYr0rPPHRTLzSTpkc15gdrF2EzSOfF9io1wWb4
         QDJt+YF/cLPVeBw+CpjPe5pAsoAWt+y4iq3Yao3vPrPITNikeR0Bse9SRxSBxy4503ou
         GhwgiYkA8YGKheyQ4wWkeIj9rbpPcqHFFLtTBonw/aVlkHzfI75+pPNM7Nw5EkjMQBoe
         d61f3BrjUhHyABGxbUa0QnuMYY7m+w/q2AaBP7NHS6QP8T/2N3UXqNuDbMqnzc1VqwRU
         3ATbFDmlD5da8CvqKJph2Oe3XiWJmMNr2Y3ZFvmuMAriS4xmcCPt4SXp1KQK7UGmHujB
         Sm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        fh=91MgUyW8r2AwUni4tyiU9AnAlPmjLJELXD4zg2wV/bY=;
        b=qNVcuXi8Ito9xvwDgx0kPl0XEPaeFIBJCziqVH/Oqd73cXerVOIvpz3FJQg6W8mH4T
         R5foKNdokf3W0haNYqU/pUs3EkwGNwWdjALKkqf4dh/ocUcKYuXDXH/vX9exryCfsDNU
         II3ZYU1dPkXhVcVXwVX0pB2uw9O2vU50umhsWHFSd4kzmv7auZqbhaYcI7ZchA3Qv/9Q
         Nd/Fag8tZeWfrPp7vPh6OSnZERhTZv9zbGkYZ8R3DzuC8CcKx8KCjdxZholLTLf7Z5I+
         LlbL9dULlOOhs05nNwBjXkLhXjMjkFf5IwPhudpT1EcF5jhRjkzO09qhGUJh98MmYyE3
         vjfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794969185; x=1795573985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=brQVox1F6VXFbGdLs1+5DMYomOu4P/zJmzDC9Ti5885w/zs4TQQIbpk+NF3r9zyy1Y
         qzRElcNXYoo8DvxnoVvb4Lbf2dAREqfcmjd+iBdL2wbVRCy4kMnQzyJFpR8fHmKM9fG+
         uQ6XWKes8zbeiQgz5eIIM+Te8KNZBYgvc4IlvpXFqiLwJwab8cpVZCulDFC1NjLhrbRp
         6wPQfnwT8XLwP0RKpR98M7DveMFpl7k7gkT0M5oawiW5vG12E08SQ+FH3gyn2OzHJ6Df
         GlPjHxzCjAc+xAHLmrN6KMr/POrH1l/qjoCfhQjmNAz7Z3gFO1JokkIfILvegihdbN1f
         arWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969185; x=1795573985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmSkdaUR1gPHZOSDkyeeXRZGjYfCAQ+xcWE+EobXcu0=;
        b=edvA1AL5+R+CCIKUdQOiqowEkZxsfrWePbsbgVA2V7hSeXkigSt7qTJtpkBUc2Utay
         8i0acysslgJyfbmHtzVBrtJtpZJjvQeEyKSET2wO7knDKpiGuMju8ZIYojvJAtGYCGpu
         vDXXByNQDPVDyZNb951YwJkT79GXOdWuU8/h1ijAk1y4XuClq8Jc14juRzQkEFJfD7Xj
         lAmtpFa9j3UHe0HYhMhzXgTmNRhp6kbkM+7/qbJBj92iHZZzzSK5xa9zDaDYAQvrxFV/
         w+w47IfrDko8tRGkMMrBuvI7jmw1EfgqCdIcmG+7NTxuBSM90F+trmYqy2OuqsmUB9mq
         rP3Q==
X-Forwarded-Encrypted: i=1; AL+hErHherf/H5wUrKHRnOTwRPMX4uzEVVvwsAkS5HcgtzbOMRG0EjmKWjin9+dTLvdBjV3fFiV03YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KVupm/TmtUSYpK8O8dbsc//3XAZQAw5BvV6BiOxIThSn6TDMS
	/IafF2I9hw+1zdj/42yAkRgPBadafv25JljR8T/62qIX76+aejzzlTTRNTCysSTAez/3S3VZBzc
	vdZ6orhohYCWFZRbfXIxWYFWT/iYH8MLNGBOznVMwKyigWC6Fb35tmyn5
X-Gm-Gg: AYBFou0uzxGzwx2tKGiK6umpg82sFd1i9/RE0Tbpp/cJC7eZBVKCywcq+kJkztc+SRW
	0rkD2GFPkO/Z4dXls7xB8LNpL/rgyk8YnyevaRdaEIlfsLcmzcKz43GQDbrPyjlK9HFSTNB1sap
	j6Y1c4yUGQMFibWFO6ISr4ehIs+kNECpr0O2mQ/oI/MnhvTmomm3pEEtcnaePHuvlgs4ugAygBW
	W7vgOcR+DSGS70+jv1B4KoqCX2CaBuoEBUqoA2IfWTZ00AJz1q013vEpl6vj4rxGLDAXTK5MgqO
	AtGs/0I0CeGipl7h/K6+bHy3syyQ4Ztxxiqw7m1FhwZCZWQlvqU6IfF4dKOJkVc0bWIH/4ct3QB
	fR/2hWPh5EQbVftcV1kdGLcW6Pwqi/8vMmhwx
X-Received: by 2002:a05:6122:2090:b0:5ec:e6b8:eb94 with SMTP id
 71dfb90a1353d-5ee64707670mr743046e0c.12.1794969184030; Tue, 17 Nov 2026
 18:33:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora> <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
 <avwBrbJfp4ET9ifT@fedora>
In-Reply-To: <avwBrbJfp4ET9ifT@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 17 Nov 2026 18:32:52 -0800
X-Gm-Features: AclHuK8PlSleIouGSsimoM04t8dnEBmceA6kyDcl75PCQlr4VIa_x83DUMY1klA
Message-ID: <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Mon, Nov 16, 2026 at 11:26=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> Hi Pin-yen,
> On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> > Hi Hangbin,
> >
> > On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux=
.dev> wrote:
> > >
> > > On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > > > Hi Pin-yen,
> > > > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > > > The prio test intermittently fails in the arp_ip_target and
> > > > > ns_ip6_target variants:
> > > > >
> > > > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [=
FAIL]
> > > > >     Current active slave is eth0 but not eth2
> > > > >
> > > > > The ARP/NS monitor marks a slave down when it has received nothin=
g for
> > > > > too long. With arp_interval 100 and the default arp_missed_max, t=
hat is
> > > > > about 250ms for the active slave (eth1) and 350ms for a backup sl=
ave
> > > > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the =
reply,
> > > > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Onc=
e eth1
> > > > > is down, its probes reach no one and no slave receives anything, =
so
> > > > > eth1 normally times out first and the new active slave is picked =
by
> > > > > prio:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D10   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 300ms -> down
> > > > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > > > >
> > > > > But the test takes eth1 down right after bond_check_connection(),=
 whose
> > > > > ping replies only arrive on eth1:
> > > > >
> > > > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > > >   t=3D70   ping reply on eth1 only
> > > > >   t=3D85   test sets eth1 down
> > > > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > > > >   t=3D400  monitor: eth1 idle 330ms -> down
> > > > >                   eth2 idle 400ms -> down too
> > > > >
> > > > > eth2 can then no longer be picked. eth0 becomes the active slave =
if it
> > > > > happened to receive some other packet (e.g. an MLD report), other=
wise
> > > > > whichever slave comes back first does. With primary_reselect 1 or=
 2,
> > > > > the bond keeps eth0 even after eth2 comes back.
> > > > >
> > > > > Before taking the active slave down, wait two monitor intervals
> > > > > (200ms), so that at least one more probe is sent after the last p=
ing
> > > > > reply and all slaves last received that probe. The miimon variant=
s do
> > > > > not need the wait, but the extra delay is negligible.
> > > >
> > > > I'm afraid the waiting time is too strict, especially with a debug =
kernel
> > > > since delays can happen.
> > > >
> > > > Bjoern is also fixing[1] this issue by pinging a non-existent neigh=
bor to
> > > > keep traffic flowing. Would you like to test whether that works for=
 you?
> > > >
> > > > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@a=
mazon.de/
> > >
> > > BTW, using ping may not able to triger the arp request in time. You c=
an try
> > > arping instead.
> >
> > Thanks for the pointer, but I believe Bjoern's patch addresses a
> > different problem.
>
> I think they are the same issue, as you comment also said
>
> The ARP/NS monitor marks a slave down when it has received nothing for
> too long.

This is the existing behavior of the bonding driver, and the prio test
uses it to check which backup slave takes over. Slaves being marked
down is not the root cause of the test failure. Instead, the root
cause is the ping replies described below.

>
> >
> > Bjoern's patch keeps the traffic flowing so that idle slaves are kept
> > alive between the test steps. This patch fixes the case where the ping
> > replies from bond_check_connection() only arrive on the active slave
> > right before it is set down. The active slave's failure is then
> > detected one monitor interval late, when the backups have also timed
> > out.
>
> The reason is we set arp interval to 100ms, and slowwait also check every
> 100ms. If the backup slave down at the same check point, e.g.
>
>   t=3D300  monitor: eth1 idle 230ms -> still up
>   t=3D400  monitor: eth1 idle 330ms -> down
>                   eth2 idle 400ms -> down too
>
> The test failed.

I don't think the slowwait interval makes a difference here.

The ARP monitor decides which slave becomes active, and slowwait only
reads the result afterwards. The test expects the active slave and the
backups to time out in different monitor runs, so that a backup can
take over. In the example above, eth2 is already down when the bond
picks the new active slave, no matter when slowwait polls.
>
> >
> > The ARP requests triggered by Bjoern's ping are sent only about once
> > per second, which isn't frequent enough for this failure. I tested
> > Bjoern's patch and confirmed that it didn't fix the issue in our
> > testing environment. We also can't simply use arping instead because
> > iputils arping doesn't support sub-second intervals.
> >
> > If you're worried that the 200ms sleep is too short, would increasing
> > it to 0.5s or 1s work for you?
>
> It's not about the sleep time before setting active slave down. I'm afrai=
d
> about the slowwait checking time. Even we sleep 1s, with arp interval 100=
,
> we still only have 100ms checking window. Before the window, the active s=
lave
> is up, after the window, the backup slave also down. With a debug kernel,=
 this
> time is a little tight.
>
> So, either we have some background arp traffic, or let's extend the arp
> interval to a larger one.
>
> What do you think?

I agree that a 100ms ARP interval could be too short in environments
like a debug kernel.

Background ARP traffic doesn't widen that window, though: it is sent
through the active slave, so once the active slave is set down,
nothing reaches the backups. It could only help with the ping reply
race if it were very frequent; Bjoern's patch triggers about one ARP
request per second and didn't fix the failures in our testing.

Increasing the ARP interval alone won't address the ping reply race,
but it should help in environments like a debug kernel. I'd prefer to
keep this patch focused on the ping reply race and send the ARP
interval change as a follow-up, but I can fold it into v2 if you
prefer.
>
> Thanks
> Hangbin

Regards,
Pin-yen
