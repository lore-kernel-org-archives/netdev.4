Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799378;
	b=K6nbeKHk8u9of43zHe87M8vhk9G/30t7NlPvEFMtMpx34ZB0oxKTFei24JJ2O82EpUEB
	 QJbJQ4QEOV/fLZwn9qQ1FAeFwGWNVTxeUFRU2itKk5vwXyKoIjCvbP7J8R4OCiBeHAmMX
	 muwCr0eErTiRG3MrpuAmWyCmZmKwn/XZLcfPizcB8wZHn6jNuxwvARblzewEvaBiKhGVR
	 /MRPJXdv32ELAIXzrEbDlm2uwthsIGnK66282B6DpwOnj39KYl9je3Kj3jsBBaU64fXin
	 1h0WYDya8PNoVCADThS2L2Kemj8hUf9UE59LDffbVu16tq8vPkMatxRYhQbnzSM2ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799378;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aVlLJ0E2o5I3XCk3MX5gNpfmRJfB1Rf6dUD454Wp1Nw=;
	b=n+eAdHhJpA0pTEJPYN1S30z7G9nfBH2SozAXQiOw94BdL9VZRCdUaHmXdIoyFYM4ChuQ
	 xqWvN75w9V5cGS7/xLpHwcwz8UIvcFfZDBENyRr71QVxshd99Bq/ixcHZcAfEAj4TJwI3
	 jwCRFSMHfDWdmUdmW05d3YBDWUq8LYBNXByA9Kyzz9zznLD9+ahXBRxYPx61QfRYIphws
	 QHIK4QiGv8uDzczXvtPNQui9Up/AleJH+q2OkHUCY5JG4haUu6jTI95CVrPu0PIsdYtPJ
	 i/vpovKyT/DArngBZmZK8xvoh+N5Nm3rnZplFdZ39iH9tBjygkiyRm/UgpCd0QH7F+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNNYFggZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BB606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNNYFggZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A471F00897;
	Fri, 27 Nov 2026 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795799378;
	bh=aVlLJ0E2o5I3XCk3MX5gNpfmRJfB1Rf6dUD454Wp1Nw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QNNYFggZHJP+ufq4Eizuegs+8Fkx3OCUsfV16M2DDtQQsaU129EI6szPbhNY23Rh0
	 p2xcRBMYV5HaZ5NSXNG0cspsIzfqo6bAAb0bbMMUFvWhH90Yg7y6O0Q2BmXSItsGTh
	 c7yvwJFlBYl78ChN/oHhZvKdCX4s4/Vmuse7IzIu6zGzk29ZYgfD+0t064WVtvjbGK
	 jW82Orb4k82J6k7JBB7K/zD1UfzppldaV4gC5WX9KS+pkf7BdDFpLmHVwNLDq/o3n6
	 lK6ol6gZWe48pEdtXSmrAO0TBnib2jAOqFeZN0jqAV2AKmS8jJJu+j23ND68H7sqj6
	 9h5beKyosIwrA==
Subject:
 Re: [PATCH net v6 1/2] ptp: serialize sysfs enable requests with ioctl paths
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew+netdev@lunn.ch,
 arnd@arndb.de, john.stultz@linaro.org, rmk+kernel@armlinux.org.uk
Date: Fri, 27 Nov 2026 17:09:37 +0000
Message-ID: <179579937722.3135.2568812643544816671@kernel.org>
In-Reply-To: <20261126-timecard-core-v6-1-ahmadexp@gmail.com>
References: <20261126-timecard-core-v6-1-ahmadexp@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Several statements in the changelog of "ptp: serialize sysfs
  enable requests with ioctl paths" do not match the patch or the tree.
- [Low] The commit's Author identity is 'ahmadexp <ahmadexp@gmail.com>',
  but the only sign-off is 'Signed-off-by: Ahmad Byagowi…

--

ptp: serialize sysfs enable requests with ioctl paths

This commit takes ptp->pincfg_mux around the ops->enable() callback in
extts_enable_store(), period_store() and pps_enable_store(). This
serializes the sysfs stores with the ioctl paths, which already hold that
mutex. If acquiring the mutex is interrupted, the stores return
-ERESTARTSYS.

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org

> ptp: serialize sysfs enable requests with ioctl paths
>
> EXTTS, PPS and period sysfs stores invoke the clock driver callback without the pincfg_mux mutex. The ioctl paths and pin configuration changes use that mutex, so sysfs can race with those operations and with other sysfs requests.
>
> Take pincfg_mux around each enable callback. Keep validation and permission checks outside the critical section, propagate callback failures, and return -ERESTARTSYS when mutex acquisition is interrupted. The mutex is required because disable callbacks may sleep while draining an IRQ.
>
> A coding assistant helped identify the missing serialization, develop the fix and regression tests, and prepare this changelog. The source-derived tests exercise the actual callbacks with controlled scheduling; KUnit coverage uses the actual stores under lock contention.
>
> Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")

[Severity: Low]

A few parts of this changelog don't seem to match the patch or the tree.

Does "propagate callback failures" describe a change in this patch? All
three stores already returned the ops->enable() error before this patch.
For example:

drivers/ptp/ptp_sysfs.c:extts_enable_store() {
    ...
	err = ops->enable(ops, &req, enable ? 1 : 0);
	if (err)
		goto out;

	return count;
out:
	return err;
}

The diff only adds the lock and unlock around the call.

The changelog mentions regression tests, source-derived tests and KUnit
coverage of the stores under lock contention. The patch only touches
drivers/ptp/ptp_sysfs.c. No test is included here or in a later patch.

Could these references be dropped, or the tests posted?

Could the changelog also name the contract that makes the missing lock a
real bug? The ptp_find_pin() kernel-doc says:

include/linux/ptp_clock_kernel.h:
 * The caller must hold ptp_clock::pincfg_mux.  Drivers do not have
 * access to that mutex as ptp_clock is an opaque type.  However, the
 * core code acquires the mutex before invoking the driver's
 * ptp_clock_info::enable() callback, and so drivers may call this
 * function from that context.

ptp_find_pin() reads ptp->info->pin_config without taking any lock
itself. About 30 drivers call it from their enable() callback, including
mlx5_extts_configure(), igb, lan743x and micrel. When those callbacks run
from the sysfs stores, they read pin_config without pincfg_mux held.

Is d94ba80ebbea the right Fixes target? pincfg_mux did not exist in that
commit. It was added later by 6092315dfdec ("ptp: introduce programmable
pins.").

Commit 62582a7ee783 ("ptp: Avoid deadlocks in the programmable pin
code.") is where the core started holding pincfg_mux around the ioctl
enable() calls, and where ptp_find_pin() was documented to rely on it.
That commit locked the ioctl paths but not the sysfs stores.

Would this be a better tag?

Fixes: 62582a7ee783 ("ptp: Avoid deadlocks in the programmable pin code.")

> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]

The Author of this commit is "ahmadexp <ahmadexp@gmail.com>", but the
Signed-off-by uses "Ahmad Byagowi <ahmadexp@gmail.com>". The email
matches and the name does not, so checkpatch reports
FROM_SIGN_OFF_MISMATCH.

Could the author name be changed to match the sign-off?

Separately, the changelog paragraphs aren't wrapped at 75 columns, which
checkpatch also flags.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-core-v6-0-ahmadexp%40gmail.com
