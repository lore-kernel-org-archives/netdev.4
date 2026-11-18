Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043029;
	b=yhg9oEIpdmtPI7h76Fni1v9gPIN6zaKZm7LjhS91MWvE4TkVGyj8VSArz2lH4eFIxqUe
	 +HboxcwmzdR2vAJIWuzs/n5ZxoLraHzGjOD/5DsQYQeWC3lFy1BRqzktWTNfSoni0FQzv
	 1eX6i/gRVLCMSUuqy3ywFGaBwsDT3sAmDPFCXjiEBlf1rPXAWLTbTDrresp/rH9/Wis8o
	 pDPnWZxSNqkOJTxmw2yA6p9daf5wqT6Ijsmx/csQpLcWlhTIXrR1SToak5CpFvf0lKSkk
	 nJKq4YXwu/g8kuQtvGQhd/ISABs8hiVcZ0bJcBoWyVgyXz1d40D3s7Cb3G0NDtwqwQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043029;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=leI1FFs3wJSFLMy2XFplwoNsj0EC2A+qYx8KybwPYGI=;
	b=honddvYe9n2pjEv473vljkeRhkfsCFEX+2KOZBDP+vZfiRfnGe0l9HrgvYF2HRYS/BfB
	 tWPp84FVieqH7Pfc19EU9q5rDOo52dCzryBSnecDq7og1iTdWUWXTtbgf5BKFNeYgwpYt
	 4ZApz0UbbvZ4cSphmovPC0IcWwTJuwOAliH0yTw6s29Xo730drLDeWpS/E2c0+U71fb/F
	 QqZY9LUJJh+2RT5iNDOcyF5gyen3aPF6ZJ5lbZ5ZgDaS/Fg7h2HzAODoLWC8gbJRq+sOD
	 xcYUqV6Kvihtb5VkNKTa6oUuxVhvYm6psEJY0zjf/31DVyVPQZZsG+vCCYsGwEEz77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GWTc4g5k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+hgwRrve;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B0606A32C;
	Wed, 18 Nov 2026 23:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30B0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GWTc4g5k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+hgwRrve
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=leI1FFs3wJSFLMy2XFplwoNsj0EC2A+qYx8KybwPYGI=;
	b=GWTc4g5krJCo/IU3KT4WlFaHCvB8m9M/xw8MeC2cfC1s0cjtUbe5NG8yILU83QC6s3imyx
	/8HCRV9PridoX7WomHLKgFCtV1ZhW5SqYGViN7lYoeOMNFVZQHT92dgzxDbex6gtpTgG4a
	nyObo8wXZsFCBM9Bz0kH7PIW0f1W2bstVPEuznhefzIIViRWPsaffS0ph4Bpppb7Htrg1C
	v/qIrjOKuWGvYqaODtam8QY5oilpxz7PJo93yQSajnFeVtnA9yce5gG9NZS8Za1ZwiB39o
	QCHIumEOh3jg9FvOPWOihVHGNY97xfWeuWe8/jk5+x3Gkee5XUk75Ouu7o8G1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=leI1FFs3wJSFLMy2XFplwoNsj0EC2A+qYx8KybwPYGI=;
	b=+hgwRrveBfg7slz3C4Vs75suxSJVdS1shAjY/DRaX0xP4hfUqwuXZ3KAMpp7efAl3obEwA
	aK+OVSrV3WC8w2AQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Gal Pressman <gal@nvidia.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Bradley Morgan <include@grrlz.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	kexec@lists.infradead.org,
	Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH printk v3 0/7] Introduce policies for unsafe flushing
Date: Thu, 19 Nov 2026 00:09:36 +0106
Message-ID: <20261118230345.808560-1-john.ogness@linutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 is here [0].

Until now unsafe flushing is only performed at the very end of
panic(), before entering the infinite loop. For other situations
(such as panic-kexec or panic-reboot or emergency-reboot) no
unsafe flushing is performed. The reasoning for this is because
an unsafe flush could lead to fireworks, which could prevent the
kexec or reboot from occurring.

However, some users may be willing to take on such risks in order
to see panic output. Indeed, for the netconsole (which does not
support safe atomic printing) it is a regression that such unsafe
printing does not occur. [1] 

This series adds unsafe flushing policy flags per-console to
allow individual consoles to perform unsafe flushing for such
scenarios. The unsafe flushing is hard-code-enabled for the
netconsole in patch 7/7. The justification is that this is not
less safe than the legacy netconsole.

Later these policy flags could be easily exposed to userspace
via /sys/class/consoles/, once the sysfs per-console interface
is available.

For this version I reduced the unsafe flush policies to the
minimum required by the netconsole: panic+restart and
emergency+restart. I also keep nbcon_atomic_flush_unsafe() and
use only this function for specifying the flush reasons. This
allows us to pinpoint where unsafe flushing is evaluated and,
as a nice bonus, to avoid all the legacy madness.

The first 4 patches have no functional changes. Hopefully they
are each small enough that a review is relatively trivial. The
functional changes (5-7) are also compact.

Changes since v2:

- Specify flush reason in nbcon_atomic_flush_unsafe() instead
  of console_flush_on_panic() and printk_trigger_flush(). This
  automatically avoids the need for any legacy handling.

- Remove KDB, PRINTK, NOTHREAD unsafe flush policies. (Not
  needed for now.)

- Add EMERGENCY_RESTART unsafe flush policy to be used for
  emergency_restart() when non-panic.

- Rename console.unsafe_flush_flags to
  console.allow_unsafe_policy.

- Change console_is_usable() to _never_ report
  CON_NBCON_ATOMIC_UNSAFE as usable.

- Introduce nbcon_is_unsafe_usable() as a variant to
  console_is_usable() to report CON_NBCON_ATOMIC_UNSAFE as
  usable. The caller decides if unsafe printing should occur.
  This is only used for nbcon+atomic flushing.

- Perform unsafe flush policy check higher up in
  __nbcon_atomic_flush_pending() instead of
  __nbcon_atomic_flush_pending_con().

John Ogness

[0] https://lore.kernel.org/lkml/20261111181942.593695-1-john.ogness@linutronix.de
[1] https://lore.kernel.org/lkml/20260915100140.3631650-1-ryan.roberts@arm.com

John Ogness (7):
  printk: Introduce and specify flush reasons
  printk: nbcon: Move unsafe takeover check to higher level
  printk: Move unsafe takeover check out of console_is_usable()
  printk: Use @reason instead of global variable to check flush policy
  console: Support unsafe flushing for panic/emergency restarts
  printk: Add unsafe flush points for panic+kexec and emergency_restart
  netconsole: Perform unsafe flushing on panic and emergency restart

 drivers/net/netconsole.c |  2 +
 include/linux/console.h  | 60 ++++++++++++++++++++------
 include/linux/printk.h   | 20 ++++++++-
 kernel/crash_core.c      |  1 +
 kernel/panic.c           |  2 +-
 kernel/printk/nbcon.c    | 91 +++++++++++++++++++++++++++-------------
 kernel/reboot.c          |  1 +
 7 files changed, 131 insertions(+), 46 deletions(-)


base-commit: ef19063ad84f8ed58ee44ebd49ba035fd5159e74
-- 
2.47.3

