Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757324;
	b=k5YlD+KJkY2h29dUTJACYKKO3EK5I/Qt/nMaJ5mmtE/R5Na8DVzcFjN4Tf25aIsa2x0D
	 6+SXZYYs542lyJi8Dckd2VSXD94ktoORHTGxPx/Dax051iSJonASxriDOPv8ia8FTVj2u
	 ITdjO2QuhWl8TWp2YNa6OqRCP0Ygj8brfXQS6OEo4Jvxm3G1o3JH3RooIuHLmjrrlR4L1
	 bTkXXbDde6D6vfPwG9pdIS4dBga4KGiFSspdwy9kz0L7HfW3EydwLUxgW25+cC7JQ+F7g
	 8z2tvwBC93Dxt6okQQfm7BMd8HoycYsYi7w6wIFYm7YmY2ohRvdfxXXjNQwatnsbJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757324;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q7EH8rs7gnW+Kg47lh9qmo9jPkWEUFUrxbk30SIuug4=;
	b=4Ugu61Pm5oQ6uNqUh/YLOBL+/JNtwVLKw38dFTdZHQB6jzYnztDMmJpWYWr0FZIkl0dY
	 8RHKUdw8b9amV0uerSwJeALLKN/7UkIKEJFO1LthJSUSpxWH0bfALLrARzOn+TfMCnY1R
	 YcdCvG2d+8n99Jca3r/XQapMqlnIbcOiGqV31ywRapBuDxpBuEndoC7F8fQQZ5uVy1y2k
	 nVUWbeusuZrFM2ag2vel+rdQTIwWyzM8Mw+x5wiCWSEPZzXM0cjgAChRtn2h7Z1EoP8cS
	 4rj5Q5GCZs28R3X8SeP5gTfoA/SMImpt1XEEwHe2P1kagg+2p415QjxthLVxFj853qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lyOq7tzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA2606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lyOq7tzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257CC1F00898;
	Fri, 27 Nov 2026 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795757323;
	bh=q7EH8rs7gnW+Kg47lh9qmo9jPkWEUFUrxbk30SIuug4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lyOq7tzOZVOCplkw3up/BQz/0bveJEW0Ak9tzmXWl1h84tUtgDP/Vd+PKyOWYLfP7
	 ENFzXpwYzBoWeRYPNUfOS14eFHto+ic8FjeplmudiEfCZ1mbL92ABb0wQKdvSHJWrQ
	 UG5AKRYRqHqc20JJv0T0iYYe8vvC9vQQUg7EcjXoNDAffGM1/hAaN9JtS3celvUisX
	 4oPXB/fryottSY6eAhkWJQrauccZokGq7w5Kc16szpshqfIyGeDJV28sj7Y2qRq3Cz
	 9VmDWzB1YQ6oE5yRHG+ziR2wN394eXwk+IQEjW1pEMXHR1my493cJ1Hf+LXsjl9hQT
	 JZTY7uvC1acMw==
Subject: Re: [PATCH net v2 1/3] net: wwan: iosm: reset the host PM state when
 the sleep handshake times out
From: netdev-bot+sashiko@kernel.org
To: davidlwesten@gmail.com
Cc: netdev@vger.kernel.org, mail@maciej.szmigiero.name,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 nihaal@cse.iitm.ac.in, m.chetan.kumar@intel.com
Date: Fri, 27 Nov 2026 05:28:42 +0000
Message-ID: <179575732269.3135.16660281513861185989@kernel.org>
In-Reply-To: <20261124172627.41847-2-davidlwesten@gmail.com>
References: <20261124172627.41847-2-davidlwesten@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 (2) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] host_sleep_complete is initialised only once, in
  ipc_pm_init(), and never re-initialised.
- [Medium] The rollback in ipc_protocol_suspend()
  (iosm_ipc_protocol.c:189) runs in process context with no lock and no…

Pre-existing issues:
- [Medium] The kernel-doc of ipc_protocol_suspend()
  (iosm_ipc_protocol.h:173) says "false if suspend must be aborted", but…
- [Medium] ipc_pm_wait_for_device_active() (iosm_ipc_pm.c:87) checks `if
  (!wait_for_completion_interruptible_timeout(...))`.

--

net: wwan: iosm: reset the host PM state when the sleep handshake times out

This patch sets host_pm_state back to IPC_MEM_HOST_PM_ACTIVE in
ipc_protocol_suspend() when ipc_pm_wait_for_device_active() times out.
This matches what the existing ENTER_SLEEP send failure path already does.
Without it the driver is left in SLEEP_WAIT_D3, later suspend and resume
transitions are refused, and doorbells are held back as pending.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.c b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> index 527355a671b64..e120e1e0ba1d8 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> @@ -185,6 +185,8 @@ bool ipc_protocol_suspend(struct iosm_protocol *ipc_protocol)
>  
>  	if (!ipc_pm_wait_for_device_active(&ipc_protocol->pm)) {

[Severity: Medium]
This is a pre-existing issue, but can an interrupted wait skip the new
reset entirely?

ipc_pm_wait_for_device_active() uses an interruptible wait and only checks
for a zero return:

drivers/net/wwan/iosm/iosm_ipc_pm.c:ipc_pm_wait_for_device_active() {
    ...
		if (!wait_for_completion_interruptible_timeout
		   (&ipc_pm->host_sleep_complete,
		    msecs_to_jiffies(IPC_PM_ACTIVE_TIMEOUT_MS))) {
    ...
}

If the suspending task has a pending signal, the wait returns
-ERESTARTSYS and the code treats that as success. The function then
returns true even though ap_state never reached IPC_MEM_DEV_PM_ACTIVE.
That contradicts its kernel-doc ("true if device is active, false on
timeout").

In that case ipc_protocol_suspend() never enters this branch. It sends
ENTER_SLEEP to a modem that is not active and sets host_pm_state to
IPC_MEM_HOST_PM_SLEEP.

This appears to be fixed later in the series by "net: wwan: iosm: fix the
wait for the modem in the host sleep handshake". That commit switches to
wait_for_completion_timeout(), which has no negative return.

>  		ipc_uevent_send(ipc_protocol->pcie->dev, UEVENT_MDM_TIMEOUT);
> +		/* The modem wasn't told to sleep, we are still active */
> +		ipc_protocol->pm.host_pm_state = IPC_MEM_HOST_PM_ACTIVE;

[Severity: Medium]
Does restoring ACTIVE here let the next suspend consume a stale completion
count?

host_sleep_complete is initialised once in ipc_pm_init() and never
reinitialised. The modem's late wake-ack can arrive after the 500 ms wait
has timed out but before host_sleep_pend is cleared. In that window this
runs:

drivers/net/wwan/iosm/iosm_ipc_pm.c:ipc_pm_on_link_wake() {
    ...
		if (test_bit(CONSUME_STATE, &ipc_pm->host_sleep_pend))
			complete(&ipc_pm->host_sleep_complete);
    ...
}

That leaves done=1 on the completion. Meanwhile
ipc_pm_wait_for_device_active() has not yet reached:

	clear_bit(0, &ipc_pm->host_sleep_pend);

Before this patch the state stayed stuck at SLEEP_WAIT_D3. Later calls to
ipc_pm_prepare_host_sleep() were refused, so the count was never
consumed.

With the reset to ACTIVE, the next ipc_protocol_suspend() reaches the wait
again. It consumes the stale count and returns true at once, even if the
modem has gone back to sleep. ENTER_SLEEP is then parked as a pending
doorbell, and host_pm_state becomes IPC_MEM_HOST_PM_SLEEP although the
modem was never told.

This looks to be fixed later in the series by "net: wwan: iosm: fix the
wait for the modem in the host sleep handshake". That commit adds
reinit_completion(&ipc_pm->host_sleep_complete) before set_bit() in
ipc_pm_wait_for_device_active().

[Severity: Medium]
Is a doorbell parked during SLEEP_WAIT_D3 ever replayed after this
rollback?

While host_pm_state is SLEEP_WAIT_D3, ipc_pm_signal_hpda_doorbell() with
host_slp_check set only records the update:

	if (host_slp_check && ipc_pm->host_pm_state != IPC_MEM_HOST_PM_ACTIVE &&
	    ipc_pm->host_pm_state != IPC_MEM_HOST_PM_ACTIVE_WAIT) {
		ipc_pm->pending_hpda_update = true;

The only automatic replay is in ipc_pm_on_link_wake(), and it requires
ACTIVE:

	if (ipc_pm->pending_hpda_update &&
	    ipc_pm->host_pm_state == IPC_MEM_HOST_PM_ACTIVE)
		ipc_pm_signal_hpda_doorbell(ipc_pm, IPC_HP_PM_TRIGGER, true);

This store runs in process context with no lock and is not serialised
with the IPC tasklet. The tasklet may handle the modem's late wake-ack
after the timeout but before this store. That window covers dev_err(),
clear_bit() and ipc_uevent_send(). If so, the tasklet still sees
SLEEP_WAIT_D3 and skips the replay.

After this store, nothing checks pending_hpda_update again. On resume,
ipc_protocol_resume() returns early because ipc_pm_prepare_host_active()
finds ACTIVE instead of SLEEP. So the EXIT_SLEEP doorbell that normally
flushes pending updates is not sent either.

Could the parked HP update, for example a DL refill, then stay undelivered
until some unrelated doorbell fires? That would be a smaller form of the
"doorbells to the modem are held back as pending" symptom this commit
message describes.

[Severity: Medium]
This isn't a bug introduced by this patch, but the new comment says "we
are still active" while the suspend still goes ahead. Is the false return
from ipc_protocol_suspend() meant to abort the suspend?

The kernel-doc in iosm_ipc_protocol.h says:

 * Returns: true if host can suspend, false if suspend must be aborted.

The only caller throws the result away:

void ipc_imem_pm_suspend(struct iosm_imem *ipc_imem)
{
	ipc_protocol_suspend(ipc_imem->ipc_protocol);
}

ipc_pcie_suspend() then always returns 0:

	ipc_imem_pm_suspend(ipc_pcie->imem);

	dev_dbg(ipc_pcie->dev, "SUSPEND done");
	return 0;

So the PM core still puts the device into D3, even though the modem was
never sent ENTER_SLEEP.

On resume, ipc_protocol_resume()->ipc_pm_prepare_host_active() expects
IPC_MEM_HOST_PM_SLEEP, finds ACTIVE, logs an error and returns false. As
a result, ipc_imem_pm_resume() skips ipc_imem_phase_update_check(). The
same happened before this patch, when the state was left at SLEEP_WAIT_D3.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124172627.41847-1-davidlwesten%40gmail.com
