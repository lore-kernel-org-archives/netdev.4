Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798086;
	b=Q8BpT/yUSeDXdOHLWDOqWA/KHxMeLXEzVZuCmTslLUTZBM9iMPDzl9e+FFWWX5in/FOR
	 py/FjOk6/37Vx5tugpgvRSzov5jRLSi9sUGx+dS61e1h5J+qK0lGoH1KzCYKTz/5HT1Pg
	 FdYNTAyK+peFJ84n/LJrGqwrD51OxeDAwg7+1mPVf9xyFDSsYuoX48IH3i+pzpKpsIWn6
	 cYdToor0xCdwtu9eOgPJEYyII95vd2sYzBb7iBKVy2/1vtT1nlHo3XgRpd40zfhtm6Ffn
	 +1NjWHzZcq02gW7sduaEPqB+2+tgyTWli1rzsHz9MCSUnzUWPG5+eD/744fxnqcgLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798086;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iVhVBEq6AUVU3m3tUfRFq2nLGDToQzbrqHjrAC4ShDM=;
	b=jacQtOE2EiBgsKOIqi0vn6nxi5dSpm6s4dwL5EP5+RsaDdKf8kIg/2BkVU8KrhnBv/to
	 2r1zvYqSnZfXT52Y/RSkw8b2ErA8twEa5h2w23sWldkQkLAT5cyy3WawFmqU6epLAuzfs
	 t+Y5Q1VerWKnv17LM/AzFpVQNpWV4PLfwzrNZgL3jSJw4N9MDvED/G+e4eUa5PK49hIa9
	 SGxWdlknGg88hiFtt4NAqmnnV0OLx9Ua9HrVNvd5lfMzsISnA3mirGoeQN6HzCqnEBttS
	 EwNSA4mj99OU8pGIY19hGBDNDiGoujT7tpem3a9yTU4D0k9LYoAgEuGirdMkTsi79yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUfOYgNh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A9606A698;
	Fri, 27 Nov 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUfOYgNh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E993B1F0092B;
	Fri, 27 Nov 2026 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798085;
	bh=iVhVBEq6AUVU3m3tUfRFq2nLGDToQzbrqHjrAC4ShDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mUfOYgNh/wxVB+F1AdtBMUx831Q5dIxxT57GlepknxyROZMDH15rFN6rthGkScOKp
	 40UWfkJMwtxUtT/PPyGjbJa/npUcwS2ePZGUHXU+QnkDeZ5+BTA2w4iXlLY4OB4tJw
	 0Pt6NB/DofG8awG837jvQEPEDVRLepEoi2e28g2Bt5tH297yun56XBjo5c1IGFc6zu
	 g1aYx2JIQr0dWKaee5CtL+9xIpU8MalvT2NMfckT5cUH1v5qbNI2RPVmLikOGTQQik
	 KYqshrPqYlfgdV/R5/if1yGEAtxhMHdfIGP4LkN7ibhMo4eJTB0o+ubmGtOaaoA9NS
	 E/PXxQuMpkxdQ==
Subject:
 Re: [PATCH net v6 5/8] ptp: ocp: report disabled SMA inputs as zero Hz
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:48:04 +0000
Message-ID: <179579808454.3135.16893919920037495221@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-5-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-5-ahmadexp@gmail.com>
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

- [Low] The changelog blames a 'stale selector frequency', but that is
  not what happens on the normal disable path.
- [Low] Two submission-hygiene problems.

--

ptp: ocp: report disabled SMA inputs as zero Hz

This commit makes ptp_ocp_dpll_frequency_get() report zero frequency for
disabled SMA input pins by forcing the selector value to SMA_DISABLE. The
goal is to let a DPLL frequency set re-enable a disabled input, since the
DPLL core compares the request against the current frequency first.

> A disabled SMA input has no active signal and should report zero frequency through DPLL. The DPLL core reads the current frequency before applying a new value, so reporting the stale selector frequency can prevent a disabled input from being re-enabled.

[Severity: Low]
Does "stale selector frequency" accurately describe what happens here?

When an input is disabled through sysfs, ptp_ocp_sma_store_val() writes 0
to the selector instead of leaving the old value in place:

drivers/ptp/ptp_ocp.c:ptp_ocp_sma_store_val() {
    ...
	if (sma->disabled)
		val = 0;
    ...
}

In ptp_ocp_sma_in[] and ptp_ocp_adva_sma_in[], selector 0x0000 is the
10 MHz entry:

	{ .name = "10Mhz",  .value = 0x0000,      .frequency = 10000000 },

So before this patch, a disabled input always read back as 10 MHz. It did
not read back as the previously configured source. For example, an input
set to PPS1 and then disabled would report 10 MHz, not 1 Hz.

The result is that only a 10 MHz re-enable request was silently dropped,
by this check in dpll_pin_freq_set():

	if (freq == old_freq)
		return 0;

On adva_x1 boards, ptp_ocp_adva_x1_sma_in[] has no 0x0000 entry. A
disabled input there already reported 0, so those boards were not
affected.

The code change itself looks correct. Could the changelog describe the
clash between the disabled value and the 0x0000 / 10 MHz encoding? It
would also help to name the affected frequency and boards, so backporters
can judge which boards and requests were affected.

> A coding assistant helped check the DPLL get-before-set behavior, develop the regression test and prepare this changelog.

[Severity: Low]
This isn't a bug, but which regression test does this refer to? The commit
only adds two lines to drivers/ptp/ptp_ocp.c and includes no selftest or
KUnit change, so the test can't be reviewed or run.

> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

The author line is "ahmadexp <ahmadexp@gmail.com>", but the Signed-off-by
is "Ahmad Byagowi <ahmadexp@gmail.com>". The email matches and the name
does not, which checkpatch reports as a From/Signed-off-by name mismatch.

If applied as is, the commit would be credited to "ahmadexp". The other
patches in the series have the same metadata.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com
