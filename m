Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990438;
	b=mQyL3chnW2p/nSm+K83qT4Lh55r2XsCqpN7L/9ufIPO8odeUp+9REVKqAEH9evZSrx+8
	 Bc3xrILssWaW3j+O++LlUy9ig4R4qKJEiwXk0vz/QXZr/5rziLneRqQZflAHUrphgyX7l
	 6pBBsEmODCJa6g4IiX7Sh7gVp2S0nNN3csF+JqDlrcGNmiMDjYakQzbm7SeKUdHHcqYeA
	 JJNcpXWVs6+41DxoUzZwHLcwqWiiGLdjvxjm65cH6w/kaoNuGdHnT69WgLI39abLjMUJd
	 G1L9vMAlkmkk+7wkSWfVg0v4iGU5xZF5MiMOuGDtkM7rP7mItzpKSJTPR2+5n2ycFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990438;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=gadXbyq6kkimUUJ2iNNLdaAaP/G19gIHifpqbx4fy98=;
	b=qrcM8bIIIe+BBIbFxe0ffz0RrfkRYYbJbUJ+C8CPFGbNbwBV/I4Mv+JgEzqhHDWL8/4C
	 c3ffRoiTxOvvn7JYC4ytAecwphLDQ3mX5eVwTanTKJginMI2zfxkJWS7d5G3CsniSOkdU
	 uz7eQAJ2GEP4rKq6AMnLIG7UNfcJfXDoekKNULwjYWbAIr2mFVfdCFjEJ+F62vkAbp8WD
	 1/X03mKaiACVEMijmgN1JY1GenI3cYBB5vK8JbSnPA0TK6fZRgVhoi/h9W34uiPtApLf+
	 xBVWKgniDDNlss716DAPC8bOkuI3gMV7cqrJjrqOovjGii9rUIjAh2uvfbY3s6RfDww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m42car4W;
	arc=none smtp.remote-ip=95.215.58.121
Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3C606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C3C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m42car4W
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aoOLVpBoWNs84O56OwBWfuEn1iIlTR6T4qFPvvTlP/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794990436; v=1; x=1795595236;
 b=m42car4Wimit/SuZmWvk0s7e+6V2UvcS0iy/1++b7+ZHPR3+5YjHsSdcLvDbZxabEc/GyIta
 bcDW9vq2GX8DqlhLUrPJqKp0HaOMVKWk253W5gqnUrp3VawRZTC+7czkT5z37NDdkpY/9mMb7d2
 rysiXhxfI0eW3U1bEabY27rw=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dd52a83b7784220a;
	Wed, 18 Nov 2026 08:27:15 +0000
X-Mizu-Trace-ID: dd52a83b7784220a
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 16:27:07 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Pin-yen Lin <treapking@google.com>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Toppins <jon.toppins+linux@gmail.com>,
	linux-kselftest@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
Message-ID: <av1hWxGIlZUJDUpl@fedora>
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora>
 <avanVkILHDYdpond@fedora>
 <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
 <avwBrbJfp4ET9ifT@fedora>
 <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>

Hi Pin-yen,
On Tue, Nov 17, 2026 at 06:32:52PM -0800, Pin-yen Lin wrote:
> Hi Hangbin,
> 
> On Mon, Nov 16, 2026 at 11:26 PM Hangbin Liu <hangbin.liu@linux.dev> wrote:
> >
> > Hi Pin-yen,
> > On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> > > Thanks for the pointer, but I believe Bjoern's patch addresses a
> > > different problem.
> >
> > I think they are the same issue, as you comment also said
> >
> > The ARP/NS monitor marks a slave down when it has received nothing for
> > too long.
> 
> This is the existing behavior of the bonding driver, and the prio test
> uses it to check which backup slave takes over. Slaves being marked
> down is not the root cause of the test failure. Instead, the root
> cause is the ping replies described below.

If the backup slaves are not mark down, we can active the correct slave
based on the priority, right? I think that's the root cause. The ping testing
is just for checking connectivity.

> 
> >
> > >
> > > Bjoern's patch keeps the traffic flowing so that idle slaves are kept
> > > alive between the test steps. This patch fixes the case where the ping
> > > replies from bond_check_connection() only arrive on the active slave
> > > right before it is set down. The active slave's failure is then
> > > detected one monitor interval late, when the backups have also timed
> > > out.
> >
> > The reason is we set arp interval to 100ms, and slowwait also check every
> > 100ms. If the backup slave down at the same check point, e.g.
> >
> >   t=300  monitor: eth1 idle 230ms -> still up
> >   t=400  monitor: eth1 idle 330ms -> down
> >                   eth2 idle 400ms -> down too
> >
> > The test failed.
> 
> I don't think the slowwait interval makes a difference here.
> 
> The ARP monitor decides which slave becomes active, and slowwait only
> reads the result afterwards. The test expects the active slave and the
> backups to time out in different monitor runs, so that a backup can
> take over. In the example above, eth2 is already down when the bond
> picks the new active slave, no matter when slowwait polls.


My idea is, by extending the arp interval, there is a larger gap. e.g.

   t=300  monitor: eth1 still up
		   ^^ slowwait check, incorrect active slave
   t=400  monitor: eth1 down
                   eth2 still up, should become active slave
   t=500  monitor: eth1 down
                   eth2 still up, active slave
		   ^^ slowwait check, correct active

> >
> > >
> > > The ARP requests triggered by Bjoern's ping are sent only about once
> > > per second, which isn't frequent enough for this failure. I tested
> > > Bjoern's patch and confirmed that it didn't fix the issue in our
> > > testing environment. We also can't simply use arping instead because
> > > iputils arping doesn't support sub-second intervals.
> > >
> > > If you're worried that the 200ms sleep is too short, would increasing
> > > it to 0.5s or 1s work for you?
> >
> > It's not about the sleep time before setting active slave down. I'm afraid
> > about the slowwait checking time. Even we sleep 1s, with arp interval 100,
> > we still only have 100ms checking window. Before the window, the active slave
> > is up, after the window, the backup slave also down. With a debug kernel, this
> > time is a little tight.
> >
> > So, either we have some background arp traffic, or let's extend the arp
> > interval to a larger one.
> >
> > What do you think?
> 
> I agree that a 100ms ARP interval could be too short in environments
> like a debug kernel.
> 
> Background ARP traffic doesn't widen that window, though: it is sent
> through the active slave, so once the active slave is set down,
> nothing reaches the backups. It could only help with the ping reply
> race if it were very frequent; Bjoern's patch triggers about one ARP
> request per second and didn't fix the failures in our testing.

For background traffic, I mean let the client send the arp requests,
not from active slave of server. With arp_validate 0, the backup slaves
will update last_rx and won't be down with idle.

> 
> Increasing the ARP interval alone won't address the ping reply race,
> but it should help in environments like a debug kernel. I'd prefer to
> keep this patch focused on the ping reply race and send the ARP
> interval change as a follow-up, but I can fold it into v2 if you
> prefer.

Doesn't extending the arp_interval (e.g. to 500) resolve your issue?
Are you still able to reproduce the problem?

Thanks
Hangbin
